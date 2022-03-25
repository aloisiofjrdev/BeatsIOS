//
//  UIViewController+Alert.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 25/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func displayMyAlertMessage(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func displayMyAlertMessageWithActionPop(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: title, style: .default) { action in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil )
    }
    
    func callViewController() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailsBeatsViewController") as! DetailsBeatsViewController
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
