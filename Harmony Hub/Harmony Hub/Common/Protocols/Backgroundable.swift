//
//  Backgroundable.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - Backgroundable Protocol
protocol Backgroundable: UIViewController {
    func makeBackground(backgroundImage: UIImageView, image: UIImage)
}

extension Backgroundable {
    func makeBackground(backgroundImage: UIImageView = UIImageView(), image: UIImage) {
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.contentMode = .scaleAspectFill
        view.addSubviews(backgroundImage)
        backgroundImage.image = image
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
