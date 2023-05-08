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
    
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        guard isValidEmail(emailTextField.text) else {
            showAlert(title: "Error", message: "Please enter a valid email address")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 8 else {
            showAlert(title: "Error", message: "Password must be at least 8 characters long.")
            return
        }
        
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = password
        
        viewModel.loginUser { result in
            switch result {
            case .success:
                print("login berhasil")
                self.showProfileViewController()
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        showRegisterViewController()
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}

extension UIViewController {
    func showLoginViewController() {
        let vc = LoginViewController()
        self.navigationController?.tabBarItem.title = "Login"
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        removeFromParent()
    }
}
