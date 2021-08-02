//
//  AuthManager.swift
//  FinBalance
//
//  Created by Rubens Ferreira Ramos on 24/07/21.
//

import Foundation
import FirebaseAuth

struct AuthManager {
    
    private let auth = Auth.auth()
    
    enum AuthError: Error {
        case unknownError
    }
    
    func singUp(_ email: String, _ password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
    func login(_ email: String, _ password: String, completion: @escaping (Result<User, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                completion(.success(user))
            } else {
                completion(.failure(AuthError.unknownError))
            }
        }
    }
    
    func logout() -> Result<Void, Error>{
        do {
            try auth.signOut()
            return .success(())
        } catch (let error) {
            return .failure(error)
        }
    }
    
    func resetPassword(withEmail email: String, completion: @escaping (Result<Void, Error>) -> Void) {
        auth.sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func isUserLoggedIn() -> Bool {
        return auth.currentUser != nil
    }
}
