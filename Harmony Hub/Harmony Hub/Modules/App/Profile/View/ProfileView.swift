//
//  ProfileView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {}

class ProfileView: BaseAppView, ProfileViewProtocol {
    //MARK: - Presenter
    var presenter: ProfileViewPresenterProtocol!
    
    //MARK: - Properties
  

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Backgrounds.profile)
    }
}

//MARK: - Configure layout
private extension ProfileView {}

#Preview() {
    ProfileView()
}
