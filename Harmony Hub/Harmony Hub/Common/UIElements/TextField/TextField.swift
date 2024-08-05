//
//  TextField.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.07.24.
//

import UIKit

class TextField: UITextField {
    
    let viewFrame: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
    let roundingRadius: CGFloat = 25
    var placeholderText: String
    
    init(frame: CGRect = .zero, placeholder: String) {
        self.placeholderText = placeholder
        super.init(frame: frame)
        configureTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        placeholder = placeholderText
        borderStyle = .none
        layer.cornerRadius = roundingRadius
        rightView = viewFrame
        leftView = viewFrame
        rightViewMode = .always
        leftViewMode = .always
        backgroundColor = Resources.Colors.Auth.textFieldBackgroundColor
        textColor = Resources.Colors.Auth.textFieldTextColor
    }
}
