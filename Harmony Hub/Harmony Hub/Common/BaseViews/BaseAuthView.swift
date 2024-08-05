//
//  BaseAuthView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - Delegates
protocol AuthDelegate: AnyObject {
    func didUpdateEmailTextField()
    func didUpdatePassTextField()
    func didTapMainButton()
    func didTapBottomButton()
}

protocol RegistraionViewDelegate {
    func didUpdateNameTextField()
}

// MARK: - BaseAuthClass
class BaseAuthView: UIViewController {
    //MARK: -- Properties [lazy]
    private lazy var contentImage: UIImageView = {
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    
    lazy var titleLabel: UILabel = {
        $0.text = ""
        $0.textAlignment = .left
        $0.textColor = Resources.Colors.Auth.titleLabelColor
        $0.font = BaseAuthClassConstants.titleFont
        return $0
    }(UILabel())
    
    
    
    lazy var googleTitleLabel: UILabel = {
        return $0
    }(UILabel())
    
    
    //MARK: -- Properties [Text Fields]
    var usernameTextField = TextField(placeholder: "")
    var emailTextField = TextField(placeholder: "")
    var passwordTextField = TextField(placeholder: "")
    
    //MARK: -- Properties [Buttons]
    var mainButton = MainButton(title: "") {}
    lazy var googleSignInButton = GoogleButton {}
    lazy var bottomButton = BottomButton(title: "") {}
    
    //MARK: -- Properties [Stacks]
    var textFieldsStackView = UIStackView()
    var buttonsStackView = UIStackView()
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    //MARK: Called if we are on the registration screen
    func removeUponLogin(_ show: Bool) {
        switch show {
        case true:
            textFieldsStackView.remove(usernameTextField)
        case false:
            textFieldsStackView.insertArrangedSubview(usernameTextField, at: 0)
        }
    }
    
}


//MARK: - Configure
extension BaseAuthView {
    //MARK: -- Configure Background
    func configureBackground(with image: UIImage) {
        view.addSubviews(contentImage)
        contentImage.image = image
        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: view.topAnchor),
            contentImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: -- Configure Layout
    func configureLayout() {
        setupStackViews()
        configureBackground(with: UIImage())
        contentImage.addSubviews(titleLabel, textFieldsStackView, buttonsStackView)
        
        makeTitleConstraint()
        makeTextFieldsStackViewConstraint()
        makeButtonStackViewConstraint()
    }
    
    //MARK: -- Tittle Constraints
    func makeTitleConstraint() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: BaseAuthClassConstants.titleLabelTopAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BaseAuthClassConstants.titleLabelLeadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: BaseAuthClassConstants.titleLabelTrailingAnchor)
        ])
    }
    
    //MARK: -- Setup StackViews
    func setupStackViews() {
        textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField])
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = BaseAuthClassConstants.textFieldStackSpacing
        
        buttonsStackView = UIStackView(arrangedSubviews: [mainButton, googleSignInButton, bottomButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = BaseAuthClassConstants.buttonsStackSpacing
        buttonsStackView.alignment = .fill
        
        
    }
    
    //MARK: -- TextFieldsStackView Constraints
    func makeTextFieldsStackViewConstraint() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: BaseAuthClassConstants.textFieldsHeight),
            usernameTextField.heightAnchor.constraint(equalToConstant: BaseAuthClassConstants.textFieldsHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: BaseAuthClassConstants.textFieldsHeight),
            
            textFieldsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: BaseAuthClassConstants.textFieldsStackViewTopAnchor),
            textFieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BaseAuthClassConstants.textFieldsStackViewLeadingAnchor),
            textFieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: BaseAuthClassConstants.textFieldsStackViewTrailingAnchor),
        ])
        
    }
    
    //MARK: -- ButtonStackView Constraints
    func makeButtonStackViewConstraint() {
        NSLayoutConstraint.activate([
            mainButton.heightAnchor.constraint(equalToConstant: BaseAuthClassConstants.buttonsHeight),
            bottomButton.heightAnchor.constraint(equalToConstant: BaseAuthClassConstants.buttonsHeight),
            buttonsStackView.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: BaseAuthClassConstants.buttonsStackViewTopAnchor),
            buttonsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: BaseAuthClassConstants.textFieldsStackViewLeadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: BaseAuthClassConstants.textFieldsStackViewTrailingAnchor)
        ])
    }
}

//#Preview() {
//    BaseAuthClass()
//}
