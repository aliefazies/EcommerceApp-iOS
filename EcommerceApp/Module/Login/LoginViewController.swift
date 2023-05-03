//
//  LoginViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 02/05/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: RegisterLoginTextField!
    @IBOutlet weak var passwordTextField: RegisterLoginTextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
//        self.showProfileViewController()
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (loginResult, error) in
            guard let `self` = self else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                self.showProfileViewController()
            }
        }
        
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        showRegisterViewController()
        removeFromParent()
    }
    
}

extension UIViewController {
    func showLoginViewController() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
}
