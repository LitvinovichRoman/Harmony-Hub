//
//  BaseAppView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

class BaseAppView: UIViewController {

    lazy var imageView: UIImageView = {
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

//MARK: - Configure layout
extension BaseAppView {
    func configureBackground(with image: UIImage) {
        view.addSubviews(imageView)
        imageView.image = image
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
