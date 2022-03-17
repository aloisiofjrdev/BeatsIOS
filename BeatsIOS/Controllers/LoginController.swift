//
//  LoginController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit
import Foundation

class LoginController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var gradienteImage: UIImageView!
    @IBOutlet weak var womanImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signInLabel: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        
        let tf = userTextField
        tf?.borderStyle = .line
        tf?.textColor = .white
        tf?.keyboardAppearance = .dark
        tf?.placeholder = "Usuário"
        
        loginButton.layer.cornerRadius = 20
        loginButton.tintColor = .white
        
    }

    
}
