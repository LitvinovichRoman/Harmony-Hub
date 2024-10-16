//
//  RegistraionViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

//MARK: - Presenter Protocol
protocol RegistrationViewPresenterProtocol: AnyObject {
    func didTapBottomButton()
    func didTapMainButton()
}

// MARK: - Final Calass RegistrationViewPresenter
final class RegistrationViewPresenter {
    weak var view: RegistrationViewProtocol?
    let authManager = AuthManager()
    
    required init(view: RegistrationViewProtocol) {
        self.view = view
    }
}

//MARK: - Protocol Methods
extension RegistrationViewPresenter: RegistrationViewPresenterProtocol  {
    func didTapMainButton() {
        let email = view?.emailTextField.text
        let password = view?.passwordTextField.text
        //let name = view?.usernameTextField.text
        
        let user = User(email: email ?? "", password: password ?? "")
        authManager.createUser(user: user) { result in
            switch result {
            case .success:
                NotificationCenter.default.post(name: .setRootViewController, object: nil, userInfo: [ Keys.viewController : StateCase.login ])
                
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func didTapBottomButton() {
        view?.navigateToLoginView()
    }
}

