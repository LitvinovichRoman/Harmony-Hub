//
//  RegistraionView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit
//MARK: -- RegistrationViewProtocol
protocol RegistrationViewProtocol: AnyObject {
    func navigateToLoginView()
}

class RegistrationView: BaseAuthClass {
    //MARK: -- Presenter
    var presenter: RegistrationViewPresenterProtocol!
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setActions()
    }
}

//MARK: -- SetUp UI
extension RegistrationView: RegistrationViewProtocol {
    private func setupUI() {
        configureBackground(with: Resources.Backgrounds.registration)
        titleLabel.text = Resources.Strings.Auth.loginTitle
        usernameTextField.placeholder = Resources.Strings.Auth.namePlaceholder
        emailTextField.placeholder = Resources.Strings.Auth.emailPlaceholder
        passwordTextField.placeholder = Resources.Strings.Auth.passPlaceholder
        mainButton.setTitle(Resources.Strings.Auth.regButtonTitle, for: .normal)
        bottomButton.setTitle(Resources.Strings.Auth.logButtonTitle, for: .normal)
    }
    
    private func setActions() {
        presenter = RegistrationViewPresenter(view: self)
        
        mainButton.completion = { self.presenter.didTapMainButton() }
        bottomButton.completion = { self.presenter.didTapBottomButton() }
    }
    
    func navigateToLoginView() {
        let loginView = LoginView()
        loginView.modalPresentationStyle = .fullScreen
        loginView.modalTransitionStyle = .partialCurl
        self.present(loginView, animated: true)
    }
    
}
#Preview() {
    RegistrationView()
}
