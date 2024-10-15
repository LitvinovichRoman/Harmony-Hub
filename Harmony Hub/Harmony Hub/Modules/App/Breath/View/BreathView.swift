//
//  BreathView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

// MARK: - BreathView Protocol
protocol BreathViewProtocol: AnyObject {
    
}

// MARK: - Final Class BreathView
final class BreathView: UIViewController, Backgroundable, BreathViewProtocol {
    //MARK: - Presenter
    var presenter: BreathViewPresenterProtocol!
    
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.breath)
    }
}

//MARK: - Configure
private extension BreathView {
    func configure() {
        title = Resources.Strings.BreathScreen.breathScreenTitle
    }
}

