//
//  BreathView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol BreathViewProtocol: AnyObject {
    
}

class BreathView: BaseAppView, BreathViewProtocol {
    //MARK: - Presenter
    var presenter: BreathViewPresenterProtocol!
    
    
    //MARK: - Properties
   

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Backgrounds.breath)
    }
}

//MARK: - Configure layout
private extension BreathView {

}


#Preview() {
    BreathView()
}
