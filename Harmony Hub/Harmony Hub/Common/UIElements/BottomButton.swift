//
//  BottomButton.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

class BottomButton: UIButton {
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
        backgroundColor = .clear
        setTitleColor(Resources.Colors.Auth.bottomButtonTitleColor, for: .normal)
    }
}
