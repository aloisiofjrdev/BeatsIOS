//
//  LoginModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation


import Foundation
import UIKit

struct BeatsList: Codable {
    let fones: [Beat]
}

struct Beat: Codable {
    let beatsModel: String
    let rate: String
    let reviews: String
    let image: String
    let price: String
}

