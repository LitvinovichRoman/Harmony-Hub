//
//  GoogleButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

class GoogleButton: UIButton {
    var completion: () -> Void
    
    init(frame: CGRect = .zero, completion: @escaping () -> Void) {
        self.completion = completion
        super.init(frame: frame)
        
        setupGoogleButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupGoogleButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            completion()
        }), for: .touchUpInside)
        
        setImage(Resources.Icons.Auth.googleButton, for: .normal)
    }
}
