//
//  AlertViewBuilderProtocol.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 27/05/20.
//

import Foundation

// Aqui vale o mesmo conceito de "tipagem" do outro protocolo
// Outro ponto o uso "excessivo" do termo "with" gera uma certa
// "poluição" de código quando você utiliza mais de um atributo
// é mais interessante "simplificar" os nomes dos métodos
// Neste caso é apenas uma dica, fique a vontade para desconsidera-la
// caso não ache válida =)
protocol AlertViewBuilderProtocol: class {
    
    func title(_ title: String?) -> AlertViewBuilder
    func icon(_ image: UIImage?) -> AlertViewBuilder
    func message(_ message: String?) -> AlertViewBuilder
    func styledMessage(_ message: NSAttributedString?) -> AlertViewBuilder
    func textAlign(_ alignment: NSTextAlignment) -> AlertViewBuilder
    func tapDismiss(_ tap: Bool) -> AlertViewBuilder
    func enableVibrate(_ enable: Bool) -> AlertViewBuilder
    func cancelButtonTitle(_ title: String?) -> AlertViewBuilder
    func doneButtonTitle(_ title: String?) -> AlertViewBuilder
    
    func titleColorButtonDone(_ color: UIColor) -> AlertViewBuilder
    func backgroundColorButtonDone(_ color: UIColor) -> AlertViewBuilder
    func titleColorButtonCancel(_ color: UIColor) -> AlertViewBuilder
    func backgroundColorButtonCancel(_ color: UIColor) -> AlertViewBuilder
    
}
