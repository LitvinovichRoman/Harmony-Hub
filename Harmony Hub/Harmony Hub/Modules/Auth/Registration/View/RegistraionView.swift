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
    var usernameTextField: TextField { set get }
    var emailTextField: TextField { set get }
    var passwordTextField: TextField { set get }
}

// MARK: - Final Class RegistrationView
final class RegistrationView: BaseAuthView, RegistrationViewProtocol {
    var presenter: RegistrationViewPresenterProtocol!
      
    //MARK: -- Lifecycle
    override func loadView() {
        super.loadView()
        isLoginView = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleView()
        initialize()
        setActions()
    }
    
    func navigateToLoginView() {
        let loginView = LoginView()
        navigationController?.pushViewController(loginView, animated: true)
    }
}

//MARK: - Configure
private extension RegistrationView  {
    func initialize() {
        usernameTextField.placeholder = Resources.Strings.Auth.namePlaceholder
        emailTextField.placeholder = Resources.Strings.Auth.emailPlaceholder
        passwordTextField.placeholder = Resources.Strings.Auth.passPlaceholder
        mainButton.setTitle(Resources.Strings.Auth.regButtonTitle, for: .normal)
        bottomButton.setTitle(Resources.Strings.Auth.logButtonTitle, for: .normal)
    }
    
    func setActions() {
        presenter = RegistrationViewPresenter(view: self)
        mainButton.action = { [ weak self ] in
            self?.presenter.didTapMainButton()
        }
        
        bottomButton.action = { [ weak self ] in
            self?.presenter.didTapBottomButton()
        }
    }
}
