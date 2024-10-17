//
//  ProfileView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {}


final class ProfileView: UIViewController, Backgroundable, ProfileViewProtocol {
    //MARK: -- Properties
    var presenter: ProfileViewPresenterProtocol!
    var authManager = AuthManager()
    
    lazy var signOutButton: UIButton = {
        $0.backgroundColor = .black
        $0.setTitle("Exit", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
        $0.widthAnchor.constraint(equalToConstant: 80).isActive = true
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 20
        $0.addAction(presenter.signOut, for: .touchUpInside)
        return $0
    }(UIButton())
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.profile)
        configureLayout()
    }
}

//MARK: - Configure
private extension ProfileView {
    func configureLayout() {
        configureButton()
    }
    
    func configureButton() {
        view.addSubviews(signOutButton)
        NSLayoutConstraint.activate([
            signOutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signOutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


