//
//  BaseAuthView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit
import SnapKit
import GoogleSignIn

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
        $0.textColor = Resources.Colors.Auth.titleLabelColor
        $0.font = BaseAuthClassConstants.titleFont
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    // TextField
    var usernameTextField = TextField(placeholder: "")
    var emailTextField = TextField(placeholder: "")
    var passwordTextField: TextField = {
        $0.isSecureTextEntry = true
        return $0
    }(TextField(placeholder: ""))
    
    // Buttons
    var mainButton = MainButton(title: "") {}
    var googleSignInButton = GoogleButton {}
    var bottomButton = BottomButton(title: "") {}
    
    // StackViews
    lazy var textFieldsStackView: UIStackView = {
        $0.spacing = BaseAuthClassConstants.textFieldStackSpacing
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [usernameTextField, emailTextField, passwordTextField]))
    
    lazy var buttonsStackView: UIStackView = {
        $0.spacing = BaseAuthClassConstants.buttonsStackSpacing
        $0.alignment = .fill
        $0.axis = .vertical
        return $0
    }(UIStackView(arrangedSubviews: [mainButton, googleSignInButton, bottomButton]))
    
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: toggleImage())
        configureLayout()
        swipeAction()
    }
}


//MARK: -  Togle Actions
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
    func configureLayout() {
        view.addSubviews(titleLabel, textFieldsStackView, buttonsStackView)
        
        makeTitleConstraint()
        makeTextFieldsStackViewConstraint()
        makeButtonStackViewConstraint()
    }
    
    func makeTitleConstraint() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(BaseAuthClassConstants.titleLabelTop)
            $0.leading.trailing.equalTo(view).inset(BaseAuthClassConstants.side)
        }
    }
    
    func makeTextFieldsStackViewConstraint() {
        let textFields = [usernameTextField, emailTextField, passwordTextField]
        textFields.forEach { $0.snp.makeConstraints { $0.height.equalTo(BaseAuthClassConstants.buttonsAndFieldsHeight) } }
        
        textFieldsStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(BaseAuthClassConstants.textFieldsStackViewTop)
            $0.leading.trailing.equalTo(view).inset(BaseAuthClassConstants.side)
        }
    }
    
    func makeButtonStackViewConstraint() {
        let buttons = [mainButton, bottomButton]
        buttons.forEach { $0.snp.makeConstraints { $0.height.equalTo(BaseAuthClassConstants.buttonsAndFieldsHeight) } }
        
        buttonsStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldsStackView.snp.bottom).offset(BaseAuthClassConstants.buttonsStackViewTop)
            $0.leading.trailing.equalTo(view).inset(BaseAuthClassConstants.side)
        }
    }
}

//MARK: - Setup Keyboard
extension BaseAuthView {
    func keyboardObserver(){
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
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
    static let titleLabelTop: CGFloat = 100
    static let side: CGFloat = 5
    static let buttonsStackSpacing: CGFloat = 50
    static let buttonsAndFieldsHeight: CGFloat = 50
    static let textFieldStackSpacing: CGFloat = 20.0
    static let textFieldsStackViewTop: CGFloat = 50
    static let buttonsStackViewTop: CGFloat = 30
}
