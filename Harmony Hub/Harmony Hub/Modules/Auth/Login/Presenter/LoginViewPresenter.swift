//
//  LoginViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

//MARK: - Presenter Protocol
protocol LoginViewPresenterProtocol: AnyObject {
    func didTapMainButton()
    func didTapGoogleButton()
}

// MARK: - Final Class LoginViewPresenter
final class LoginViewPresenter {
    weak var view: LoginViewProtocol?
    private let authManager = AuthManager()
    
    required init(view: any LoginViewProtocol) {
        self.view = view
    }
}

//MARK: - Protocol Methods
extension LoginViewPresenter: LoginViewPresenterProtocol {
    func didTapMainButton() {
        let email = view?.emailTextField.text ?? ""
        let password = view?.passwordTextField.text ?? ""
        
        let user = User(email: email, password: password)
        authManager.login(user: user) { result in
            switch result {
            case .success:
                NotificationCenter.default.post(name: .setRootViewController, object: nil, userInfo: [ Keys.viewController : StateCase.main ])
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func didTapGoogleButton() {
        guard let viewController = view as? UIViewController else { return }
        
        authManager.loginWithGoogle(presentingViewController: viewController) { result in
            switch result {
            case .success:
                NotificationCenter.default.post(name: .setRootViewController, object: nil, userInfo: [ Keys.viewController : StateCase.main ])
            case .failure(let error):
                print(error)
            }
        }
    }
}
