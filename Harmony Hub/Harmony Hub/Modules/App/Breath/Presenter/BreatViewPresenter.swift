//
//  BreatViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol BreathViewPresenterProtocol {
    init(view: BreathViewProtocol)
}

class BreathViewPresenter: BreathViewPresenterProtocol {
    weak var view: BreathViewProtocol?
    
    required init(view: any BreathViewProtocol) {
        self.view = view
    }
}


