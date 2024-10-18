//
//  PosesDetailViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.10.2024.
//

import Foundation

protocol PosesDetailViewPresenterProtocol {
    init(view: PosesDetailViewProtocol)
}

final class PosesDetailViewPresenter: PosesDetailViewPresenterProtocol {
    weak var view: PosesDetailViewProtocol?
    
    init(view: any PosesDetailViewProtocol) {
        self.view = view
    }
    
    
}
