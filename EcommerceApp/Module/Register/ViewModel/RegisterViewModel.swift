//
//  RegisterViewModel.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 07/05/23.
//

import Foundation
import FirebaseAuth

class RegisterViewModel {
    var email: String = ""
    var password: String = ""
    var username: String = ""
    
    func registerUser(completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard let `self` = self else { return }
            
            if let error = error {
                completion(.failure(error))
            }else if let user = result?.user {
                let request = user.createProfileChangeRequest()
                request.displayName = self.username
                
                request.commitChanges { error in
                    if let error = error {
                        completion(.failure(error))
                    }else {
                        completion(.success(()))
                    }
                }
            }
        }
    }
}
