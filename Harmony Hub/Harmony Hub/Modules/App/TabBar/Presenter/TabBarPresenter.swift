//
//  TabBarPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarProtocol)
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarProtocol?
    
    required init(view: any TabBarProtocol) {
        self.view = view
    }
    
    
}
