//
//  TabBarItem.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit
import SnapKit

// MARK: - Final Class TabBarItem
final class TabBarItem: UIView {
    //MARK: -- Properties
    private var tabItem: TabItem
    private var imageRightConstraints: NSLayoutConstraint?
    private var isSelected: (TabBarItem) -> Void
    
    var isActive: Bool {
        willSet  {
            self.imageRightConstraints?.isActive = !newValue
            self.contentView.backgroundColor = newValue ? Resources.Colors.TabBar.active: Resources.Colors.TabBar.inactive
            UIView.animate(withDuration: TabBarItemConstants.animateDuration) { self.layoutIfNeeded()
            }
        }
    }
    
    //MARK: -- Properties
    private lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = isActive ? Resources.Colors.TabBar.active: Resources.Colors.TabBar.inactive
        $0.layer.cornerRadius = TabBarItemConstants.cornerRadius
        $0.addSubviews(tabImage, tabText)
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabAction)))
        return $0
    }(UIView())
    
    private lazy var tabImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = tabItem.tabImage
        $0.snp.makeConstraints { $0.size.equalTo(TabBarItemConstants.tabImageSize)}
        return $0
    }(UIImageView())
    
    private lazy var tabText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = tabItem.tabText
        $0.textColor = .black
        return $0
    }(UILabel())
    
    // MARK: -- Init Methods
    init(tabItem: TabItem, imageRightConstraints: NSLayoutConstraint? = nil, isActive: Bool, isSelected: @escaping (TabBarItem) -> Void) {
        self.tabItem = tabItem
        self.imageRightConstraints = imageRightConstraints
        self.isActive = isActive
        self.isSelected = isSelected
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -- Action
    @objc private func tabAction() {
        self.isSelected(self)
    }
}

// MARK: - Configure Layout
private extension TabBarItem {
    func configureLayout() {
        addSubviews(contentView)
        
        imageRightConstraints = tabImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  TabBarItemConstants.newImageRightConstraints)
        imageRightConstraints?.isActive = !isActive
        makeContentViewConstarint()
        makeTabImageConstarint()
        makeTabTextConstarint()
    }
    
    func makeContentViewConstarint() {
        contentView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func makeTabImageConstarint() {
        tabImage.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(TabBarItemConstants.tabImageTop)
            $0.leading.equalTo(contentView).offset(TabBarItemConstants.tabImageLeading)
            $0.bottom.equalTo(contentView).offset(TabBarItemConstants.tabImageBottom)
        }
    }
    
    func makeTabTextConstarint() {
        tabText.snp.makeConstraints {
            $0.leading.equalTo(tabImage.snp.trailing).offset(TabBarItemConstants.tabTextLeading)
            $0.trailing.equalTo(contentView).offset(TabBarItemConstants.tabTextTrailing)
            $0.centerY.equalTo(tabImage)
        }
    }
}

//MARK: - TabBarItemConstants
fileprivate enum TabBarItemConstants {
    static let animateDuration: TimeInterval = 0.2
    static let cornerRadius: CGFloat = 20
    static let tabImageSize: CGFloat = 25
    static let newImageRightConstraints: CGFloat = -10
    static let tabImageTop: CGFloat = 10
    static let tabImageBottom: CGFloat = -10
    static let tabImageLeading: CGFloat = 10
    static let tabTextLeading: CGFloat = 10
    static let tabTextTrailing: CGFloat = -10
}

