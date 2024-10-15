//
//  RegistraionView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit

//MARK: - RegistrationView Protocol
protocol RegistrationViewProtocol: AnyObject {
    func navigateToLoginView()
}

// MARK: - Final Class RegistrationView
final class RegistrationView: BaseAuthView, RegistrationViewProtocol, Backgroundable {
    var presenter: RegistrationViewPresenterProtocol!
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.registration)
        initialize()
        setActions()
    }
    
    func navigateToLoginView() {
        let loginView = LoginView()
        loginView.modalPresentationStyle = .fullScreen
        loginView.modalTransitionStyle = .partialCurl
        self.present(loginView, animated: true)
    }
}

//MARK: - Configure
private extension RegistrationView  {
    func initialize() {
        titleLabel.text = Resources.Strings.Auth.loginTitle
        usernameTextField.placeholder = Resources.Strings.Auth.namePlaceholder
        emailTextField.placeholder = Resources.Strings.Auth.emailPlaceholder
        passwordTextField.placeholder = Resources.Strings.Auth.passPlaceholder
        mainButton.setTitle(Resources.Strings.Auth.regButtonTitle, for: .normal)
        bottomButton.setTitle(Resources.Strings.Auth.logButtonTitle, for: .normal)
    }
    
    func setActions() {
        presenter = RegistrationViewPresenter(view: self)
        mainButton.action = { self.presenter.didTapMainButton() }
        bottomButton.action = { self.presenter.didTapBottomButton() }
    }
}
