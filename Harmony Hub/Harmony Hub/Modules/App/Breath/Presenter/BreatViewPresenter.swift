//
//  BreatViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - BreathViewPresenter Protocol
protocol BreathViewPresenterProtocol {
    init(view: BreathViewProtocol)
}

// MARK: - Final Class BreathViewPresenter
final class BreathViewPresenter: BreathViewPresenterProtocol {
    weak var view: BreathViewProtocol?
    
    required init(view: any BreathViewProtocol) {
        self.view = view
    }
}


