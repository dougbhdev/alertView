//
//  AlertViewConfig.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 27/05/20.
//

import Foundation

public struct AlertViewConfig {
    
    // MARK: - Properties

    public var image: UIImage?
    public var title: String?
    public var attributedDescription: NSAttributedString?
    public var textAlign: NSTextAlignment = .center
    public var tapDismiss: Bool = true
    public var cancelButtonTitle: String?
    public var doneButtonTitle: String?
    public var enableVibrate: Bool = true
    public var cancelAction: AlertAction?
    public var doneAction: AlertAction?
    
    public var titleColorButtonDone: UIColor = .white
    public var backgroundColorButtonDone = UIColor(red: 0.03, green: 0.31, blue: 0.62, alpha: 1)
    
    // Um comentário aqui só porque eu sou "chato" mesmo com isso rsrss
    // na property abaixo vc declara ela como ": UIColor"
    // já na property em sequencia vc atribui um "UIColor.red"
    // é mais "coerente" manter um único padrão, ou faz igual ao 1 ou ao 2
    // essa "mistura" pode gerar (Não estou dizendo que vai) uma sensação
    // de que você esta fazendo as coisas meio que no "copia e cola"
    public var titleColorButtonCancel: UIColor = .white
    public var backgroundColorButtonCancel: UIColor = .red
    
    // MARK: - Public Methods

    public init() {
        // Intentionally unimplemented...
    }
    
}
