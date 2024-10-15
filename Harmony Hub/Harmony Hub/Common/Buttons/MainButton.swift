//
//  MainButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

// MARK: - Final Class MainButton
final class MainButton: UIButton {
    let roundingRadius: CGFloat = 25
    
    var title: String
    var action: () -> Void
    
    init(title: String, completion: @escaping () -> Void) {
        self.title = title
        self.action = completion
        super.init(frame: .zero)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
private extension MainButton {
    func configureButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            action()
        }), for: .touchUpInside)
        
        setTitle(title, for: .normal)
        backgroundColor = Resources.Colors.Auth.mainButtonBackgroundColor
        setTitleColor(Resources.Colors.Auth.mainButtonTitleColor, for: .normal)
        layer.cornerRadius = roundingRadius
    }
}
