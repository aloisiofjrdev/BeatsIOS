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
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var pwErrorLabel: UILabel!
    
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        resetFormulario()
        
        
    }
    
    func resetFormulario() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        userErrorLabel.isHidden = false
        pwErrorLabel.isHidden = false
        
        userErrorLabel.text = ""
        pwErrorLabel.text = ""
        
        userTextField.text = ""
        pwTextField.text = ""
    }
    
    @IBAction func userTextFieldChange(_ sender: Any) {
        
        if let userName = userTextField.text {
            if let errorMessage = invalidUsername(userName){
                userErrorLabel.text = errorMessage
                userErrorLabel.isHidden = false
                
            } else{
                userErrorLabel.isHidden = true
            }
            
        }
        
        checkForValideForm()
    }
    
    func invalidUsername(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Nome de usúario inválido"
        }
        return nil
    }
    
    @IBAction func pwTextFieldChange(_ sender: Any) {
        
        if let password = pwTextField.text {
            if let errorMessage = invalidPw(password){
                pwErrorLabel.text = errorMessage
                pwErrorLabel.isHidden = false
                
            } else{
                pwErrorLabel.isHidden = true
            }
            
        }
        
        checkForValideForm()
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
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        
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
        
        
        
        signInLabel.text = "Ainda não é cadastrado?    "
        signInLabel.textColor = .white
        signInLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        userErrorLabel.textColor = .red
        userErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwErrorLabel.textColor = .red
        pwErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        let greenAttsSB: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor .green, .font: UIFont.boldSystemFont(ofSize: 15)]
        let attibutedTitleSignin = NSMutableAttributedString(string: "Inscreve-se", attributes: greenAttsSB )
        signInButton.setAttributedTitle(attibutedTitleSignin, for: .normal)
        

        
    }
    
    func checkForValideForm() {
        if userErrorLabel.isHidden && pwErrorLabel.isHidden {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
    
    //MARK: - Actions
    
    @IBAction func entrarButton(_ sender: Any) {
        
        resetFormulario()
        
    }

    
}
