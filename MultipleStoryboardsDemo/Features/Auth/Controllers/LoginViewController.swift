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
    
    var viewModel = LoginViewModel()
    
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
           
           if viewModel.isValid {
               goToHome()
           }
    }
    
    @objc func textChanged() {
        validateFields()
    }
    
    func validateFields() {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        
        viewModel.validate(email: email, password: password)
        
        loginBtn.isEnabled = viewModel.isValid
        loginBtn.alpha = viewModel.isValid ? 1.0 : 0.5
        
        if let error = viewModel.errorMessage {
            showError(message: error)
        } else {
            clearError()
        }
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
