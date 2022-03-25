//
//  LoginViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation


struct LoginsViewModel {
    
    // MARK: - Properties
    
    private var login: LoginModel = LoginModel()
    
    var nomeText: String {
        return self.login.nomeText
    }
    
    var subNomeText: String {
        return self.login.subNomeText
    }
    
    var placeholderUserText: String {
        return self.login.placeholderUserText
    }
    
    var placeholderPwText: String {
        return self.login.placeholderPwText
    }
    
    var loginButtonText: String {
        return self.login.loginButtonText
    }
    
    var signUpText: String {
        return self.login.signUpText
    }
    
    var signUpButtonText: String {
        return self.login.signUpButtonText
    }
    
    // MARK: - Methods
    
    func invalidUsername(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Nome de usúario inválido"
        }
        return nil
    }
    
    func invalidPw(_ value:String) -> String? {
        
        if value.count < 8 {
            return "Senha precisa conter no mínimo 8 caracteres"
        }
        if containsDigit(value) {
            return "Senha precisa conter no mínimo 1 dígito"
        }
        return nil
    }
    
    func containsDigit(_ value: String) -> Bool {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    
    
}
