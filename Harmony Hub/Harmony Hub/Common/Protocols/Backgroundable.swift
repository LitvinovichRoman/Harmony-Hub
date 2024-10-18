//
//  Backgroundable.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit
import SnapKit

// MARK: - Backgroundable Protocol
protocol Backgroundable: UIViewController {
    func makeBackground(backgroundImage: UIImageView, image: UIImage)
}

extension Backgroundable {
    func makeBackground(backgroundImage: UIImageView = UIImageView(), image: UIImage) {
        backgroundImage.isUserInteractionEnabled = true
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = image
        
        view.addSubviews(backgroundImage)
        backgroundImage.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
