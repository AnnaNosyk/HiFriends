//
//  AuthService.swift
//  HiFriends
//
//  Created by Anna Nosyk on 23/06/2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    // login with email form
    func login(email: String?, password: String?, complition: @escaping (Result<User,Error>)-> Void) {
        
        guard let email = email,
              let password = password  else {
                  complition(.failure(AuthErrors.notFilled))
            return
        }

        auth.signIn(withEmail: email, password: password) { result, error in
            guard let result = result else { complition(.failure(error!))
                return }
            complition(.success(result.user))
        }
        }
        
    // for registration with email form
    func registration(email: String?, password: String?, confPassword: String?, complition: @escaping (Result<User,Error>)-> Void) {
        guard Validators.isFilled(email: email, password: password, confirmPassword: confPassword) else {
             complition(.failure(AuthErrors.notFilled))
            return
        }
        
        guard password!.lowercased() == confPassword!.lowercased() else {
            complition(.failure(AuthErrors.passwordNotMatch))
            return
        }
        
        guard Validators.isSimpleEmail(email!) else {
            complition(.failure(AuthErrors.invalidEmail))
            return
        }
        
        auth.createUser(withEmail: email!, password: password!) { result, error in
            guard let result = result else { complition(.failure(error!))
                return }
            complition(.success(result.user))
        }
    }
}


