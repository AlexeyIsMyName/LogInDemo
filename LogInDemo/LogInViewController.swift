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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userName = userName
    }
    
    // Метод для скрытия клавиатуры тапом по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        userNameTextField.endEditing(true)
        passwordTextField.endEditing(true)
    }
    
    @IBAction func logInButtonPressed() {
        performSegue(withIdentifier: "welcomeVC", sender: nil)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        var message = "Your name is \(userName)"
        
        if sender.tag == 1 {
            message = "Your password is \(password)"
        }
        
        showAlert(title: "Ooops!", message: message, buttonHandler: nil)
    }
}

// MARK: - Alert Controller
extension LogInViewController {
    private func showAlert(title: String,
                           message: String,
                           buttonHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK",
                                        style: .default,
                                        handler: buttonHandler)
        
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
