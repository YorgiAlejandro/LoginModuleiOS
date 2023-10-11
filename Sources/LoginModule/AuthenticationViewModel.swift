//
//  AuthenticationViewModel.swift
//  ModulesWithSPM
//
//  Created by Yorgi Del Rio on 10/10/23.
//

import Foundation

public enum LoginStatus : Error {
    case success
    case error
}

final public class AuthenticationViewModel: ObservableObject { //ObservableObject es desde donde van a salir los datos
    @Published public var loginStatus: LoginStatus = .success //Published son los datos publicados
    @Published public var didUpdateLoginStatus: Bool = false
    
    public init () {}
    
    public func login (email: String, password: String) {
        if email.lowercased() == "yorgialejandro6@gmail.com" {
            loginStatus = .success
        } else {
            loginStatus = .error
        }
        didUpdateLoginStatus = true
    }
    
    func signUp (email: String, password: String) {
        print("registrarse...")
    }
    
    func recoverPassword (email: String) {
        print("Recuperar contraseña...")
    }
}
