//
//  BaseAppView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

class BaseAppView: UIViewController {

    lazy var contentImage: UIImageView = {
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
    }
}

//MARK: - Configure layout
extension BaseAppView {
    func configureBackground(with image: UIImage) {
        view.addSubviews(contentImage)
        contentImage.image = image
        NSLayoutConstraint.activate([
            contentImage.topAnchor.constraint(equalTo: view.topAnchor),
            contentImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            contentImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
