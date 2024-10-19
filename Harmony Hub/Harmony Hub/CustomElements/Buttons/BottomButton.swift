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
    
    let roundingRadius: CGFloat = 25
    
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
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).withAlphaComponent(0.2)
        setTitleColor(Resources.Colors.Auth.bottomButtonTitleColor, for: .normal)
        layer.masksToBounds = true
        layer.cornerRadius = roundingRadius
    }
}
