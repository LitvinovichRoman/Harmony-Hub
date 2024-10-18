//
//  ProfileView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit
import SnapKit

protocol ProfileViewProtocol: AnyObject {}


final class ProfileView: UIViewController, Backgroundable, ProfileViewProtocol {
    //MARK: -- Properties
    var presenter: ProfileViewPresenterProtocol!
    var authManager = AuthManager()
    
    lazy var signOutButton: UIButton = {
        $0.addAction(presenter.signOut, for: .touchUpInside)
        $0.snp.makeConstraints { $0.height.equalTo(40) }
        $0.snp.makeConstraints { $0.width.equalTo(80) }
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("Exit", for: .normal)
        $0.layer.masksToBounds = true
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 20
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
        signOutButton.snp.makeConstraints { $0.center.equalToSuperview() }
    }
}


