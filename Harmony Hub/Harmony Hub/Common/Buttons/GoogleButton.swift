//
//  GoogleButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

// MARK: - Final Class GoogleButton
final class GoogleButton: UIButton {
    var action: () -> Void
    
    init(frame: CGRect = .zero, completion: @escaping () -> Void) {
        self.action = completion
        super.init(frame: frame)
        setupGoogleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
private extension GoogleButton {
    func setupGoogleButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            action()
        }), for: .touchUpInside)
        
        setImage(Resources.Icons.Auth.googleButton, for: .normal)
    }
}
