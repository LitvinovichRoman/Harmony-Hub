//
//  BreathView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

class BreathView: UIViewController {
    //MARK: - Properties
    private lazy var backgroundImage: UIImageView = {
        $0.isUserInteractionEnabled = true
        $0.image = Resources.Images.Background.breath
        $0.alpha = 0.3
        return $0
    }(UIImageView())

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
    }
}

//MARK: - Configure layout
private extension BreathView {
    private func configureLayout() {
        configureBackground()
    }
    
    //MARK: - Configure background
    func configureBackground() {
        view.addSubviews(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
