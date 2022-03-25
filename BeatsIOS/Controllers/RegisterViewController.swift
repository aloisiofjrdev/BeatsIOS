//
//  RegisterViewController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation
import UIKit


class RegisterViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwRepeatTextField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var pwErrorLabel: UILabel!
    @IBOutlet weak var pwRepeatErrorLabel: UILabel!
    @IBOutlet weak var alreadyRegisterLabel: UILabel!
    @IBOutlet weak var alreadyRegisterButtonLabel: UIButton!
    
    private let registerVM: RegisterViewModel = RegisterViewModel()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        resetFormulario()
    }
    
    //MARK: - Methods
    
    private func configureUI() {
        
        self.navigationController?.navigationBar.barStyle = .black
        
        nomeLabel.text = registerVM.nomeText
        nomeLabel.textColor = .white
        nomeLabel.font = UIFont.boldSystemFont(ofSize: 50)
        nomeLabel.textAlignment = .center
        
        descriptionLabel.text = registerVM.subNomeText
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        
        
        userTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        userTextField.keyboardAppearance = .dark
        userTextField.textColor = .white
        userTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderUserText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        
        pwTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwTextField.keyboardAppearance = .dark
        pwTextField.textColor = .white
        pwTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderPwText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        
        pwRepeatTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwRepeatTextField.keyboardAppearance = .dark
        pwRepeatTextField.textColor = .white
        pwRepeatTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderPwRepeatText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        buyButton.layer.cornerRadius = 20
        buyButton.tintColor = .white
        buyButton.setTitle(registerVM.registerButtonText, for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buyButton.setTitleColor(.white, for: .normal)
        
        
        
        alreadyRegisterLabel.text = registerVM.alreadyRegisterLabelText
        alreadyRegisterLabel.textColor = .white
        alreadyRegisterLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        userErrorLabel.textColor = .red
        userErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwErrorLabel.textColor = .red
        pwErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwRepeatErrorLabel.textColor = .red
        pwRepeatErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        
        
        let greenAttsSB: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor .green, .font: UIFont.boldSystemFont(ofSize: 15)]
        let attibutedTitleSignin = NSMutableAttributedString(string: registerVM.alreadyRegisterButtonText, attributes: greenAttsSB )
        alreadyRegisterButtonLabel.setAttributedTitle(attibutedTitleSignin, for: .normal)
        
    }
    
    private func resetFormulario() {
        buyButton.isEnabled = false
        buyButton.alpha = 0.5
        userErrorLabel.isHidden = false
        pwErrorLabel.isHidden = false
        
        userErrorLabel.text = ""
        pwErrorLabel.text = ""
        pwRepeatErrorLabel.text = ""
        
        userTextField.text = ""
        pwTextField.text = ""
        pwRepeatTextField.text = ""
    }
    
    private func checkForValideForm() {
        if userErrorLabel.isHidden && pwErrorLabel.isHidden && pwRepeatErrorLabel.isHidden {
            buyButton.isEnabled = true
            buyButton.alpha = 1
        } else {
            buyButton.isEnabled = false
            buyButton.alpha = 0.5
        }
    }
    
    private func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title: "Alerta", message: userMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    //MARK: - Actions
    
    @IBAction func userTextFieldChanged(_ sender: Any) {
        
        guard let userName = userTextField.text else { return }
        
        if userName.isEmpty {
            userErrorLabel.text = ""
        } else {
            if let errorMessage = invalidUsername(userName) {
                userErrorLabel.text = errorMessage
                userErrorLabel.isHidden = false
                
            } else{
                userErrorLabel.isHidden = true
            }
        }
        
        checkForValideForm()
        
    }
    
    @IBAction func pwTextFieldChanged(_ sender: Any) {
        
        guard let password = pwTextField.text else { return }
        
        if password.isEmpty {
            pwErrorLabel.text = ""
        } else {
            if let errorMessage = invalidPw(password) {
                pwErrorLabel.text = errorMessage
                pwErrorLabel.isHidden = false
                
            } else{
                pwErrorLabel.isHidden = true
            }
        }
        
        checkForValideForm()
    }
    
    @IBAction func pwRepeatTextFieldChanged(_ sender: Any) {
        
        guard let passwordRp = pwRepeatTextField.text else { return }
        
        if passwordRp.isEmpty {
            pwRepeatErrorLabel.text = ""
        } else {
            if let errorMessage = invalidPw(passwordRp) {
                pwRepeatErrorLabel.text = errorMessage
                pwRepeatErrorLabel.isHidden = false
                
            } else{
                pwRepeatErrorLabel.isHidden = true
            }
            
        }
        
        checkForValideForm()
    }
    
    @IBAction func registerButtonAction(_ sender: Any) {
        
        guard let userEmail = userTextField.text else { return }
        guard let userPw = pwTextField.text else { return }
        guard let userPwRepeat = pwRepeatTextField.text else { return }
        
        if userPw != userPwRepeat {
            
            displayMyAlertMessage(userMessage: "As senha não são iguais")
            return
        }
        
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPw, forKey: "userPw")
    
        
        let myAlert = UIAlertController(title: "Alerta", message: "Cadastro feito com sucesso!", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        }
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
        
        resetFormulario()
        
    }
    
    @IBAction func alreadyRegisterButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
        
}

    // MARK: - RegisterViewModelDelegate

extension RegisterViewController: RegisterViewModelDelegate {
    
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
    
    
