//
//  AlertView.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 24/05/20.
//

import Foundation

extension CustomAlertView: AlertViewProtocol {
    
    // Outro ponto que eu acho estranho, mas ai vai mais de pessoa pra pessoa
    // essa quebra de linha dos parametros das funções
    // acho que fica muito "like C#"
    // mas enfim tem gente que curte e tem gente que não
    // não é um erro propriamente dito, mas eu acho estranho =)
    public func show(config: AlertViewConfig,
                     doneAction: AlertAction? = nil,
                     cancelAction: AlertAction? = nil) {
        
        let alert = CustomAlertView()
        
        alert.configureAlert(with: config)
        alert.actionCallback(done: doneAction, cancel: cancelAction)
        
        DispatchQueue.global().sync {
            alert.show(animated: true, alpha: 0.4, vibrate: config.enableVibrate)
        }
    }
    
}
