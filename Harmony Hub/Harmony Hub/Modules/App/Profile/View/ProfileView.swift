//
//  ProfileView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol ProfileViewProtocol: AnyObject {}

class ProfileView: UIViewController, Backgroundable, ProfileViewProtocol {
    //MARK: - Presenter
    var presenter: ProfileViewPresenterProtocol!
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.profile)
    }
}

//MARK: - Configure
private extension ProfileView {
    
}


