//
//  AlertViewDelegate.swift
//  AlertView
//
//  Created by Douglas Henrique Goulart Nunes on 26/05/20.
//

import Foundation

// Como as suas 2 ações são closures "identicas" não faz sentido ter um typealias para cada uma
public typealias AlertAction = (() -> Void)

// É interessante "tipar" seu protocolo para garantir que, por exemplo, uma Struct
// não consiga conformar com o mesmo, quando não temos a tipagem basicamente
// "qualquer" objeto/classe (Any) conseguirá conformar com o mesmo
public protocol AlertViewProtocol: class {
    
    func show(config: AlertViewConfig, doneAction: AlertAction?, cancelAction: AlertAction?)
    
}
