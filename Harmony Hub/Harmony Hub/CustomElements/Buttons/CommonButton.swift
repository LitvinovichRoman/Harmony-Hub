//
//  CommonButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.2024.
//

import UIKit

// MARK: - Final Class CommonButton
final class CommonButton: UIButton {
    var action: () -> Void
    
    init(frame: CGRect = .zero, completion: @escaping () -> Void) {
        self.action = completion
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure
private extension CommonButton {
    func configureButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            action()
        }), for: .touchUpInside)
    }
}
