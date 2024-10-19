//
//  TabView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

// MARK: - Final Class TabView
final class TabView: UIView {
    // MARK: -- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureTabBar()
    }
    
    // MARK: -- Init Method
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Configure TabView
private extension TabView {
    func configureTabBar() {
        backgroundColor = TabViewConstants.backgroundColor
        layer.borderColor = TabViewConstants.borderColor
        layer.borderWidth = TabViewConstants.borderWidth
        layer.cornerRadius = TabViewConstants.cornerRadius
        clipsToBounds = true
    }
}

//MARK: - TabViewConstants
fileprivate enum TabViewConstants {
    static let cornerRadius: CGFloat = 35
    static let backgroundColor: UIColor = .white
    static let borderWidth: CGFloat = 2
    static let borderColor = UIColor.systemGray6.cgColor
}
