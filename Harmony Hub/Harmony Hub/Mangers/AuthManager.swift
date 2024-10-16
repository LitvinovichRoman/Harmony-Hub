//
//  AuthManager.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 15.10.2024.
//

import Foundation
import FirebaseAuth

enum AuthError: Error {
    case invalidUser
    case invalidUserData
}

// MARK: - Final Class AuthManager
final class AuthManager {
    
    func createUser(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { [ weak self ] result, error in
            guard let self else { return }
            guard error == nil else {
                completion(.failure(AuthError.invalidUserData))
                return
            }
            
            result?.user.sendEmailVerification()
            signOut()
            completion(.success(true))
        }
    }
    
    func login(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { [ weak self ] result, error in
            guard let self else { return }
            guard error == nil else {
                print(error!)
                completion(.failure(error!))
                return
            }
            
            guard let user = result?.user else {
                completion(.failure(AuthError.invalidUser))
                return
            }
            
            if !user.isEmailVerified {
                completion(.failure(AuthError.invalidUser))
                signOut()
                return
            }
            
            completion(.success(true))
        }
    }
    
    func signOut() {
        do { try Auth.auth().signOut() }
        catch { print(error) }
    }
    
    func isLogin() -> Bool {
        if let _ = Auth.auth().currentUser { return true }
        return false
    }
}
