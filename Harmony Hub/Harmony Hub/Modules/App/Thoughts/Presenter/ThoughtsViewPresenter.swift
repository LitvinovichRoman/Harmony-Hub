//
//  ThoughtsViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol ThoughtsViewPresenterProtocol: AnyObject {
    init(view: ThoughtsViewProtocol)
}

class ThoughtsViewPresenter: ThoughtsViewPresenterProtocol {
    weak var view: ThoughtsViewProtocol?
    
    required init(view: any ThoughtsViewProtocol) {
        self.view = view
    }
}
