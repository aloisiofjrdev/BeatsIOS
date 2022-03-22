//
//  LoginModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation
import UIKit


struct Login: Codable {
    var nomeText: String = "Meus Beats"
    let subNomeText: String
    let placeholderUserText: String
    let placeholderPwText: String
    let loginButtonText: String
    let signUpText: String
    let signUpButtonText: String
}
