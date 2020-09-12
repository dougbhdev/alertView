//
//  WindowView.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 21/05/20.
//

import Foundation
import UIKit

// Mesmo comentario da "tipagem"
protocol WindowView: class {
    
    var background: UIView { get }
    var dialogBox: UIView { get set }
    
    func show(animated: Bool, alpha: CGFloat, vibrate: Bool)
    func dismiss(animated: Bool)
    
}

extension WindowView where Self: UIView {
    
    internal func show(animated: Bool, alpha: CGFloat, vibrate: Bool) {
        background.alpha = 0.0
        
        // não entendi o porque das "??"
        // Realmente eu não entendi o que este trecho de código faz
        // porque dentro do seu "while" você esta apenas atribuindo a variavel "rootViewController"
        // mas vc não faz nada com ela na sequencia, só depois que o "while" finaliza
        // você faz um "addSubview", talvez se o intuito for adicionar a sua dialog na pilha 
        // "após" a ultima controller sendo exibida não seria melhor usar um ".last" nas 
        // viewController que estão na pilha em questão?
        // Como não entendi a finalidade deste trecho posso inclusive ter falado bobagem ai em cima
        if var rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
            while let presentedViewController = rootViewController.presentedViewController {
                rootViewController = presentedViewController
            }

            rootViewController.view.addSubview(self)
        }
        
        if animated {
            transform = CGAffineTransform(scaleX: 1, y: 1)
            positionView()
            
            if vibrate {
                vibrateAlert()
            }

            // Esse trecho de código me gerou um certo "code smell"
            // Você tem um animate que no completion faz outro animate
            // que no completion faz outra coisa
            // essa cadeia de animações poderiam talvez ser feitas em metodos isolados?
            // com uma closure de resposta talvez?
            // Realmente suas animações tem que ser trigadas N vezes?
            // Digo isso porque você suprimiu o "finished" dos completions
            // isso quer dizer que durante o tempo de execução da sua animação o bloco de completion
            // será chamado N vezes e isso pode causar um "comportamento anormal"
            // Você pode dizer, ah, mas a animação dura apenas 0.1 segundos
            // Ok?!
            // Agora imagine se vc um dia resolve permitir que o tempo de duração da animação seja
            // parametrizado?! Para testar a minha "teoria" sugiro vc aumentar esse tempo para tipo 3 ou 5 segundos
            // e ver se o codigo mantera o mesmo funcionamento =)
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveEaseInOut,
                           animations: {
                            self.background.alpha = alpha
                            
                            self.alpha = 1
                            self.transform = .identity                
            }, completion: { _ in
                UIView.transition(with: self,
                                  duration: 0.1,
                                  options: [.transitionCrossDissolve, .curveEaseInOut, .beginFromCurrentState],
                                  animations: {
                                    self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                }, completion: { _ in
                    self.transformIdentity(identity: .identity)
                })
            })
        } else {
            positionView()
        }
    }
    
    internal func transformIdentity(identity: CGAffineTransform) {
        UIView.animate(withDuration: 0.2) {
            self.transform = identity
        }
    }
    
    internal func dismiss(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.2) {
                self.background.alpha = 0
            }
            
            UIView.transition(with: self,
                              duration: 0.3,
                              options: [.transitionCrossDissolve, .curveEaseInOut, .beginFromCurrentState],
                              animations: {
                                self.alpha = 0
                                self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }, completion: { _ in
                self.removeFromSuperview()
            })
        } else {
            removeFromSuperview()
        }
    }
    
    // MARK: - Private Methods
    
    private func positionView() {
        dialogBox.center = center
    }
    
    private func vibrateAlert() {
        VibrationType.light.vibrate()
    }
    
}
