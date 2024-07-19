//
//  MainView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol MainViewProtocol: AnyObject {}

class MainView: BaseAppView, MainViewProtocol {
    //MARK: - Presenter
    var presenter: MainViewPresenterProtocol!
    
    //MARK: - Properties
   
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Backgrounds.main)
    }
}

//MARK: - Configure layout
private extension MainView {}

#Preview() {
    MainView()
}

