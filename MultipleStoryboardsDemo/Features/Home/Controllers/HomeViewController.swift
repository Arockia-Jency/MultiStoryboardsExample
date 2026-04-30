//
//  HomeViewController.swift
//  MultipleStoryboardsDemo
//
//  Created by Grootan on 29/04/26.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        let storyboard = UIStoryboard(name: Constants.Storyboard.profile, bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: Constants.viewController.profile)
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
}
