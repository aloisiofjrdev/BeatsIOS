//
//  LoginController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit
import Foundation
import MaterialComponents

class LoginController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var gradienteImage: UIImageView!
    @IBOutlet weak var womanImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.barStyle = .black
        
        nameLabel.text = "Meu Beats"
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 50)
        nameLabel.textAlignment = .center
        
        descriptionLabel.text = "Especializados em fones para deejay"
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        
        
        userTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        userTextField.keyboardAppearance = .dark
        userTextField.textColor = .white
        userTextField.attributedPlaceholder = NSAttributedString(string: "Usuário", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        
        pwTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwTextField.keyboardAppearance = .dark
        pwTextField.textColor = .white
        pwTextField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        loginButton.layer.cornerRadius = 20
        loginButton.tintColor = .white
        loginButton.setTitle("Entrar", for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loginButton.setTitleColor(.white, for: .normal)
        
        
        
        signInLabel.text = "Ainda não é cadastrado? "
        signInLabel.textColor = .white
        signInLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        let greenAttsSB: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor .green, .font: UIFont.boldSystemFont(ofSize: 15)]
        let attibutedTitleSignin = NSMutableAttributedString(string: "Inscreve-se", attributes: greenAttsSB )
        signInButton.setAttributedTitle(attibutedTitleSignin, for: .normal)
        

        
    }
    
    //MARK: - Actions
    
    @IBAction func entrarButton(_ sender: Any) {
        self.navigationController?.pushViewController(ProductListController(), animated: true)
        
    }

    
}
