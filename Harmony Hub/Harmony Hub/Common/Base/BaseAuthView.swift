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
class BaseAuthView: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate, Backgroundable {
    
    //MARK: -- Properties
    var isLoginView: Bool = false
    
    var titleLabel: UILabel = {
        $0.textAlignment = .left
        $0.textColor = Resources.Colors.Auth.titleLabelColor
        $0.font = BaseAuthClassConstants.titleFont
        return $0
    }(UILabel())
    
    var googleTitleLabel: UILabel = {
        return $0
    }(UILabel())
    
    // TextField
    var usernameTextField = TextField(placeholder: "")
    var emailTextField = TextField(placeholder: "")
    var passwordTextField = TextField(placeholder: "")
    
    // Buttons
    var mainButton = MainButton(title: "") {}
    lazy var googleSignInButton = GoogleButton {}
    lazy var bottomButton = BottomButton(title: "") {}
    
    // StackViews
    var textFieldsStackView = UIStackView()
    var buttonsStackView = UIStackView()
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: toggleImage())
        configureLayout()
        swipeAction()
    }
}


//MARK: - Toggle Actions
extension BaseAuthView {
    func toggleView() {
        switch isLoginView {
        case true:
            textFieldsStackView.remove(usernameTextField)
            titleLabel.text = Resources.Strings.Auth.loginTitle
        case false:
            textFieldsStackView.insertArrangedSubview(usernameTextField, at: 0)
            titleLabel.text = Resources.Strings.Auth.registrationTitle
        }
    }
    
    func toggleImage() -> UIImage {
        return isLoginView ? Resources.Backgrounds.login : Resources.Backgrounds.registration
    }
}


//MARK: - Configure
private extension BaseAuthView {
    
    //MARK: -- Configure Layout
    func configureLayout() {
        setupStackViews()
        view.addSubviews(titleLabel, textFieldsStackView, buttonsStackView)
        
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
    
    func setupStackViews() {
        textFieldsStackView = UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField])
        textFieldsStackView.axis = .vertical
        textFieldsStackView.spacing = BaseAuthClassConstants.textFieldStackSpacing
        
        buttonsStackView = UIStackView(arrangedSubviews: [mainButton, googleSignInButton, bottomButton])
        buttonsStackView.axis = .vertical
        buttonsStackView.spacing = BaseAuthClassConstants.buttonsStackSpacing
        buttonsStackView.alignment = .fill
        
        
    }
    
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

//MARK: - Setup Keyboard
extension BaseAuthView {
    func keyboardObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        view.frame.origin.y = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            view.frame.origin.y -= (keyboardSize.height / 2)
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    @objc func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func swipeAction() {
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
}

//MARK: - BaseAuthClassConstants
enum BaseAuthClassConstants {
    static let titleFont: UIFont = .systemFont(ofSize: 24, weight: .bold)
    static let titleLabelTopAnchor: CGFloat = 200
    static let titleLabelLeadingAnchor: CGFloat = 5
    static let titleLabelTrailingAnchor: CGFloat = -5
    static let textFieldsHeight: CGFloat = 50
    static let buttonsStackSpacing: CGFloat = 50
    static let buttonsHeight: CGFloat = 50
    static let textFieldStackSpacing: CGFloat = 20.0
    static let textFieldsStackViewTopAnchor: CGFloat = 50
    static let buttonsStackViewTopAnchor: CGFloat = 30
    static let textFieldsStackViewLeadingAnchor: CGFloat = 5
    static let textFieldsStackViewTrailingAnchor: CGFloat = -5
}
