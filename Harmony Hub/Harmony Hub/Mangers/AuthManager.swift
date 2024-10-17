//
//  AuthManager.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 15.10.2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import GoogleSignIn

// MARK: - Error Enum
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
            
            guard  let uid = result?.user.uid else { return }
            saveUsername(user: user, userId: uid) { [ weak self ] isAdd in
                switch isAdd {
                case true:
                    self?.signOut()
                    completion(.success(true))
                case false:
                    print("[ class-AuthManager-line-37 ]")
                    return
                }
            }
        }
    }
    
    // MARK: -- Save Username Data
    private func saveUsername(user: User, userId: String, completion: @escaping (Bool) -> Void) {
        print(Auth.auth().currentUser?.uid ?? "")
        Firestore.firestore()
            .collection("users")
            .document(userId)
            .setData(["name": user.name ?? "", "email" : user.email]) { error in
                guard error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    // MARK: -- Email Login
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
    
    // MARK: -- Google Login
    func loginWithGoogle(presentingViewController: UIViewController, completion: @escaping (Result<Bool, Error>) -> Void) {
        guard (FirebaseApp.app()?.options.clientID) != nil else { return }

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            let idToken = result?.user.idToken?.tokenString
            let accessToken = result?.user.accessToken.tokenString
            
            guard let idToken, let accessToken else {
                completion(.failure(AuthError.invalidUserData))
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                completion(.success(true))
            }
        }
    }
    
    // MARK: - Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance.signOut()
        } catch {
            print(error)
        }
    }
    
    // MARK: - Check Login
    func isLogin() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
}
