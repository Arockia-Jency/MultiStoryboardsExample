//
//  LoginViewController.swift
//  MultipleStoryboardsDemo
//
//  Created by Grootan on 29/04/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        emailField.clipsToBounds = true
        passwordField.clipsToBounds = true
        emailField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        
        loginBtn.isEnabled = false
        
    }
    
    
    @IBAction func onLoginPress(_ sender: UIButton) {
        validateFields()
        
        if loginBtn.isEnabled {
            goToHome()
        }
    }
    
    @objc func textChanged() {
        validateFields()
    }
    
    func validateFields() {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            loginBtn.isEnabled = false
            errorLabel.isHidden = true
            return
        }
        
        if !isValidEmail(email) {
            showError(message: "Invalid email format")
            loginBtn.isEnabled = false
            errorLabel.isHidden = false
            return
        }
        
        if password.count < 6 {
            showError(message: "Password must be at least 6 characters")
            loginBtn.isEnabled = false
            errorLabel.isHidden = false
            return
        }
        
        clearError()
        loginBtn.isEnabled = true
        errorLabel.isHidden = true
        loginBtn.alpha = loginBtn.isEnabled ? 1.0 : 0.5
    }
    
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: email)
    }
    
    func goToHome(){
        let storyboard = UIStoryboard(name: Constants.Storyboard.home, bundle: nil)
        let homeVC = storyboard.instantiateViewController(withIdentifier: Constants.viewController.home)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func showError(message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
    
    func clearError() {
        errorLabel.isHidden = true
    }
    
}
