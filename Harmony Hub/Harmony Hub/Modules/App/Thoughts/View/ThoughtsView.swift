//
//  ThoughtsView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol ThoughtsViewProtocol: AnyObject {
    
}

class ThoughtsView: BaseAppView, ThoughtsViewProtocol {
    //MARK: - Presenter
    var presenter: ThoughtsViewPresenterProtocol!
    
    //MARK: - Properties
   

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Backgrounds.thoughts)
    }
}

//MARK: - Configure layout
private extension ThoughtsView {}


#Preview() {
    ThoughtsView()
}
