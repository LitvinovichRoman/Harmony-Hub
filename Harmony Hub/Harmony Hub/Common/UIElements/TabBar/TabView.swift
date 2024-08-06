//
//  TabView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

class TabView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        backgroundColor = TabViewConstants.backgroundColor
        layer.borderColor = TabViewConstants.borderColor
        layer.borderWidth = TabViewConstants.borderWidth
        layer.cornerRadius = TabViewConstants.cornerRadius
        clipsToBounds = true

    }

}
