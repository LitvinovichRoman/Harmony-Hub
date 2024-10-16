//
//  LoginView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 12.07.24.
//

import UIKit
//MARK: -  LoginView Protocol
protocol LoginViewProtocol: AnyObject {
    func navigateToRegistrationView()
    var emailTextField: TextField { set get }
    var passwordTextField: TextField { set get }
}

// MARK: - Final Class LoginView
final class LoginView: BaseAuthView, LoginViewProtocol {
    
    //MARK: -- Properties
    var presenter: LoginViewPresenterProtocol!
   
    //MARK: -- Lifecycle
    override func loadView() {
        super.loadView()
        isLoginView = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleView()
        initialize()
        setActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func navigateToRegistrationView() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - Configure
private extension LoginView {
    func initialize() {
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
