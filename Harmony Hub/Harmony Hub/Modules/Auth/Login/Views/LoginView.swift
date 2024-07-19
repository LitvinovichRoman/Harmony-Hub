//
//  LoginView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit
//MARK: -- LoginViewProtocol
protocol LoginViewProtocol: AnyObject {
    func navigateToLoginView()
}

class LoginView: BaseAuthClass {
    //MARK: -- Presenter
    var presenter: LoginViewPresenterProtocol!
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setActions()
    }
}

//MARK: -- SetUp UI
extension LoginView: LoginViewProtocol {
    private func setupUI() {
        configureBackground(with: Resources.Backgrounds.registration)
        removeUponLogin(true)
        titleLabel.text = Resources.Strings.Auth.loginTitle
        usernameTextField.placeholder = Resources.Strings.Auth.namePlaceholder
        emailTextField.placeholder = Resources.Strings.Auth.emailPlaceholder
        passwordTextField.placeholder = Resources.Strings.Auth.passPlaceholder
        mainButton.setTitle(Resources.Strings.Auth.logButtonTitle, for: .normal)
        bottomButton.setTitle(Resources.Strings.Auth.regButtonTitle, for: .normal)
    }
    
    private func setActions() {
        presenter = LoginViewPresenter(view: self)
        
        mainButton.completion = { self.presenter.didTapMainButton() }
        bottomButton.completion = { self.presenter.didTapBottomButton() }
    }
    
    func navigateToLoginView() {
        let regView = RegistrationView()
        regView.modalPresentationStyle = .fullScreen
        regView.modalTransitionStyle = .partialCurl
        self.present(regView, animated: true)
    }
}

#Preview() {
    LoginView()
}
