//
//  BreathViewController.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

class BreathViewController: UIViewController {
    //MARK: - Properties
    private lazy var backgroundImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = true
        $0.image = Resources.Images.Background.breath
        $0.alpha = 0.3
        return $0
    }(UIImageView())

    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
    }
}

//MARK: - Configure layout
private extension BreathViewController {
    private func configureLayout() {
        configureBackground()
    }
    
    //MARK: - Configure background
    func configureBackground() {
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
