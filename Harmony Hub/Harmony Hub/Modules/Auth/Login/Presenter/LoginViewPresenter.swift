//
//  LoginViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

//MARK: -- PresenterProtocol
protocol LoginViewPresenterProtocol: AnyObject {
    func didUpdateEmailTextField()
    func didUpdatePassTextField()
    func didTapMainButton()
    func didTapBottomButton()
   
}

class LoginViewPresenter {
    weak var view: LoginViewProtocol?
    
    required init(view: any LoginViewProtocol) {
        self.view = view
    }
}

//MARK: -- Protocol Methods
extension LoginViewPresenter: LoginViewPresenterProtocol {
    func didUpdateEmailTextField() {
        //logic for updating emfil text field
    }
    
    func didUpdatePassTextField() {
        //logic for updating password text field
    }
    
    func didTapMainButton() {
        print("MainButton: from LoginViewPresenterProtocol")
    }
    
    func didTapBottomButton() {
        view?.navigateToLoginView()
    }
    
}
