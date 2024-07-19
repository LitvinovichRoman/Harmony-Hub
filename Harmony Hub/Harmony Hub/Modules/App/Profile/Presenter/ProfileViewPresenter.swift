//
//  ProfileViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol ProfileViewPresenterProtocol: AnyObject {
    init(view: ProfileViewProtocol)
}

class ProfileViewPresenter: ProfileViewPresenterProtocol {
    weak var view: ProfileViewProtocol?
    
    required init(view: any ProfileViewProtocol) {
        self.view = view
    }
}
