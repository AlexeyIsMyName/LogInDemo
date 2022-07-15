//
//  LogInViewController.swift
//  LogInDemo
//
//  Created by ALEKSEY SUSLOV on 15.07.2022.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let userName = "User"
    private let password = "Password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        var message = "Your name is \(userName)"
        
        if sender.tag == 1 {
            message = "Your password is \(password)"
        }
        
        showAlert(title: "Ooops!",
                  message: message) { _ in
            self.dismiss(animated: true)
        }
    }
    
    private func showAlert(title: String, message: String, buttonHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: buttonHandler ?? nil)
        
        alert.addAction(alertAction)
        
        present(alert, animated: true)
    }
}
/*
 Palette:
 #1: D9F8C4
 #2: F9F9C5
 #3: FAD9A1
 #4: F37878
 */
