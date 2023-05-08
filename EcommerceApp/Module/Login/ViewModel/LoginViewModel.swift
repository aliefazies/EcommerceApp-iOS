//
//  LoginViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 07/05/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel {
    var email: String = ""
    var password: String = ""
    
    func loginUser(completion: @escaping (Result<User, Error>) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (loginResult, error) in
            if let error = error {
                completion(.failure(error))
            } else if let user = loginResult?.user {
                completion(.success(user))
            }
        }
    }
    
    private func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
