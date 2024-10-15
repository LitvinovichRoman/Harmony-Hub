//
//  LoginView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit
//MARK: -  LoginView Protocol
protocol LoginViewProtocol: AnyObject {
    func navigateToLoginView()
}

// MARK: - Final Class LoginView
final class LoginView: BaseAuthView, Backgroundable, LoginViewProtocol {
    //MARK: -- Presenter
    var presenter: LoginViewPresenterProtocol!
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.registration)
        initialize()
        setActions()
    }
    
    func navigateToLoginView() {
        let regView = RegistrationView()
        regView.modalPresentationStyle = .fullScreen
        regView.modalTransitionStyle = .partialCurl
        self.present(regView, animated: true)
    }
}

//MARK: - Configure
private extension LoginView {
    func initialize() {
        removeUponLogin(true)
        titleLabel.text = Resources.Strings.Auth.loginTitle
        usernameTextField.placeholder = Resources.Strings.Auth.namePlaceholder
        emailTextField.placeholder = Resources.Strings.Auth.emailPlaceholder
        passwordTextField.placeholder = Resources.Strings.Auth.passPlaceholder
        mainButton.setTitle(Resources.Strings.Auth.logButtonTitle, for: .normal)
        bottomButton.setTitle(Resources.Strings.Auth.regButtonTitle, for: .normal)
    }
    
    func setActions() {
        presenter = LoginViewPresenter(view: self)
        mainButton.action = { [ weak self ] in
            self?.presenter.didTapMainButton()
        }
        
        bottomButton.action = { [ weak self ] in
            self?.presenter.didTapBottomButton()
        }
    }
}
