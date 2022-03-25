//
//  LoginModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation
import UIKit

//Model antiga

//struct FonesModel: Codable {
//    let fones: [Beat]
//}

struct FonesModel: Codable {
    let beatsModel: String
    let rate: String
    let reviews: String
    let image: String
    let price: String
}

