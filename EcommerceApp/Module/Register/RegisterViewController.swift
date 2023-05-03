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
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Email is not valid"])
            print(error)
            return
        }
        
        guard let password = passwordTextField.text else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Password is not valid"])
            print(error)
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (registerResult, error) in
            guard let `self` = self else { return }
            
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print("register berhasil")
                let request = registerResult?.user.createProfileChangeRequest()
                request?.displayName = "alief"
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        showLoginViewController()
        removeFromParent()
    }
}

extension UIViewController {
    func showRegisterViewController() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        self.navigationController?.isNavigationBarHidden = true
    }
}
