//
//  MainViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol MainViewPresenterProtocol {
    init(view: MainViewProtocol)
}

class MainViewPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    
    required init(view: any MainViewProtocol) {
        self.view = view
    }
}
