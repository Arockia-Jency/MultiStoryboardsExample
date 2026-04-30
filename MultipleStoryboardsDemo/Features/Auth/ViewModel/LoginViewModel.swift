//
//  LoginViewModel.swift
//  MultipleStoryboardsDemo
//
//  Created by Grootan on 30/04/26.
//


import Foundation

class LoginViewModel {
    
   
    var errorMessage: String?
    var isValid: Bool = false
    
    func validate(email: String, password: String) {
        
        // Empty check
        if email.isEmpty || password.isEmpty {
            isValid = false
            errorMessage = nil
            return
        }
        
        // Email validation
        if !isValidEmail(email) {
            isValid = false
            errorMessage = "Invalid email format"
            return
        }
        
        // Password validation
        if password.count < 6 {
            isValid = false
            errorMessage = "Password must be at least 6 characters"
            return
        }
        
        // Success
        isValid = true
        errorMessage = nil
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex)
            .evaluate(with: email)
    }
}
