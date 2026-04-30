//
//  ProfileViewController.swift
//  MultipleStoryboardsDemo
//
//  Created by Grootan on 29/04/26.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        showLogoutConfirmation()
    }
    
    func showLogoutConfirmation() {
        let alert = UIAlertController(
            title: "Logout",
            message: "Are you sure you want to logout?",
            preferredStyle: .alert
        )
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .destructive) { _ in
            self.goToAuth()
        }
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func goToAuth(){
        let storyboard = UIStoryboard(name: Constants.Storyboard.authentication, bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: Constants.viewController.authentication)
        let nav = UINavigationController(rootViewController: loginVC)
        UIApplication.shared.windows.first?.rootViewController = nav
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}
