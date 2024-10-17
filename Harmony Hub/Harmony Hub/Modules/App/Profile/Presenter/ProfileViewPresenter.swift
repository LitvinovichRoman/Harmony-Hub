//
//  ProfileViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - ProfileViewPresenter Protocol
protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
    var signOut: UIAction { get }
}

// MARK: - Final class ProfileViewPresenter
final class ProfileViewPresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewProtocol?
    private let authManager = AuthManager()
    
    init(view: any ProfileViewProtocol) {
        self.view = view
    }
     
    lazy var signOut: UIAction = {
        let action = UIAction { [ weak self ] _ in
            self?.authManager.signOut()
            NotificationCenter.default.post(name: .setRootViewController,
                                            object: nil,
                                            userInfo: [ Keys.viewController : StateCase.login ])
        }
        return action
    }()
}
