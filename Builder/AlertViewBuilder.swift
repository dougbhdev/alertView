//
//  AlertViewBuilder.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 27/05/20.
//

import Foundation

public class AlertViewBuilder: AlertViewBuilderProtocol {
    
    // MARK: - Properties
    
    // Como seu "AlertConfig" não recebe nenhum atributo no init dele
    // faz mais sentido já inicializar esta variavel aqui e torna-la um `let`
    // já que ela é "imutável" e como seu init é publico você um precedente "grave"
    // Se eu extender sua classe de Builder pela herança e fizer um override do init
    // e não chamar o super.init() seu objeto de config jamais será instanciado
    private let config: AlertViewConfig = AlertViewConfig()
    
    // MARK: - Public Methods
    
    public init() {}
    
    public func icon(_ image: UIImage?) -> AlertViewBuilder {
        config.image = image
        return self
    }
    
    public func title(_ title: String?) -> AlertViewBuilder {
        config.title = title
        return self
    }
    
    public func message(_ message: String?) -> AlertViewBuilder {
        guard let message = message else { return self }

        config.attributedDescription = NSAttributedString(string: message)
        return self
    }
    
    public func styledMessage(_ message: NSAttributedString?) -> AlertViewBuilder {
        guard let message = message else { return self }

        config.attributedDescription = message
        return self
    }
    
    public func textAlign(_ alignment: NSTextAlignment) -> AlertViewBuilder {
        config.textAlign = alignment
        return self
    }
    
    public func tapDismiss(_ tap: Bool) -> AlertViewBuilder {
        config.tapDismiss = tap
        return self
    }
    
    public func enableVibrate(_ enable: Bool) -> AlertViewBuilder {
        config.enableVibrate = enable
        return self
    }
    
    public func cancelButtonTitle(_ title: String?) -> AlertViewBuilder {
        config.cancelButtonTitle = title
        return self
    }
    
    public func doneButtonTitle(_ title: String?) -> AlertViewBuilder {
        config.doneButtonTitle = title
        return self
    }
    
    public func titleColorButtonDone(_ color: UIColor) -> AlertViewBuilder {
        config.titleColorButtonDone = color
        return self
    }
    
    public func backgroundColorButtonDone(_ color: UIColor) -> AlertViewBuilder {
        config.backgroundColorButtonDone = color
        return self
    }
    
    public func titleColorButtonCancel(_ color: UIColor) -> AlertViewBuilder {
        config.titleColorButtonCancel = color
        return self
    }
    
    public func backgroundColorButtonCancel(_ color: UIColor) -> AlertViewBuilder {
        config.backgroundColorButtonCancel = color
        return self
    }
    
    public func build() -> AlertViewConfig {
        return config
    }
    
}
