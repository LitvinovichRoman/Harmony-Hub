//
//  RegistraionViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

//MARK: - Presenter Protocol
protocol RegistrationViewPresenterProtocol: AnyObject {
    func didUpdateUsernameTextField()
    func didUpdateEmailTextField()
    func didUpdatePassTextField()
    func didTapBottomButton()
    func didTapMainButton()
}

// MARK: - Final Calass RegistrationViewPresenter
final class RegistrationViewPresenter {
    weak var view: RegistrationViewProtocol?
    
    required init(view: RegistrationViewProtocol) {
        self.view = view
    }
}

//MARK: - Protocol Methods
extension RegistrationViewPresenter: RegistrationViewPresenterProtocol  {
    func didUpdateUsernameTextField() {
        //logic for updating username text field
    }
    
    func didUpdateEmailTextField() {
        //logic for updating email text field
    }
    
    func didUpdatePassTextField() {
        //logic for updating password text field
    }
    
    func didTapMainButton() {
        print("MainButton: from RegistrationViewPresenter")
    }
    
    func didTapBottomButton() {
        view?.navigateToLoginView()
    }
}

