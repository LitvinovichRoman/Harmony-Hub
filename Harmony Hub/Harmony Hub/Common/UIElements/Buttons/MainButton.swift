//
//  MainButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

class MainButton: UIButton {
    let roundingRadius: CGFloat = 25
    
    var title: String
    var completion: () -> Void
    
    init(title: String, completion: @escaping () -> Void) {
        self.title = title
        self.completion = completion
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            completion()
        }), for: .touchUpInside)
        
        setTitle(title, for: .normal)
        backgroundColor = Resources.Colors.Auth.mainButtonBackgroundColor
        setTitleColor(Resources.Colors.Auth.mainButtonTitleColor, for: .normal)
        layer.cornerRadius = roundingRadius
    }
}
