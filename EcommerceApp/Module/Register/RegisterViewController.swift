//
//  RegisterViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 02/05/23.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: RegisterLoginTextField!
    @IBOutlet weak var passwordTextField: RegisterLoginTextField!
    @IBOutlet weak var usernameTextField: RegisterLoginTextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    private var viewModel = RegisterViewModel()
    
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
    
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        guard isValidEmail(emailTextField.text) else {
            showAlert(title: "Error", message: "Please enter a valid email address.")
            return
        }
        
        guard let password = passwordTextField.text, password.count >= 8 else {
            showAlert(title: "Error", message: "Password must be at least 8 characters long.")
            return
        }
            
        
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = password
        viewModel.username = usernameTextField.text ?? ""
        
        viewModel.registerUser { result in
            switch result {
            case .success:
                print("register berhasil")
                self.showAlert(title: "Success", message: "Register Berhasil")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        showLoginViewController()
        removeFromParent()
    }
    
    private func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {
    func showRegisterViewController() {
        let vc = RegisterViewController()
        self.navigationController?.tabBarItem.title = NSLocalizedString("Register", comment: "")
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
        removeFromParent()
    }
}
