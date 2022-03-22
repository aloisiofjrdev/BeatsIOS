//
//  LoginViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation

struct LoginsViewModel {
    private let login: Login
}

extension LoginsViewModel {
    init(_ login: Login) {
        self.login = login
    }
}

extension LoginsViewModel {

    var nomeText: String {
        return self.login.nomeText
    }


}
