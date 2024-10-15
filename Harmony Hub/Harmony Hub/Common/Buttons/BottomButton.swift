//
//  BottomButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

// MARK: - Final Class BottomButton
final class BottomButton: UIButton {
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
private extension BottomButton {
    func configureButton() {
        addAction(UIAction(handler: { [ weak self ] _ in
            guard let self else { return }
            action()
        }), for: .touchUpInside)
        
        setTitle(title, for: .normal)
        backgroundColor = .clear
        setTitleColor(Resources.Colors.Auth.bottomButtonTitleColor, for: .normal)
    }
}
