//
//  TabBarItem.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

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
        $0.heightAnchor.constraint(equalToConstant: TabBarItemConstants.tabImageHeightAnchor).isActive = true
        $0.widthAnchor.constraint(equalToConstant: TabBarItemConstants.tabImageWidthAnchor).isActive = true
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
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func makeTabImageConstarint() {
        NSLayoutConstraint.activate([
            tabImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: TabBarItemConstants.tabImageTopAnchor),
            tabImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: TabBarItemConstants.tabImageLeadingAnchor),
            tabImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: TabBarItemConstants.tabImageBottomAnchor),
        ])
    }
    
    func makeTabTextConstarint() {
        NSLayoutConstraint.activate([
            tabText.leadingAnchor.constraint(equalTo: tabImage.trailingAnchor, constant: TabBarItemConstants.tabTextLeadingAnchor),
            tabText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: TabBarItemConstants.tabTextTrailingAnchor),
            tabText.centerYAnchor.constraint(equalTo: tabImage.centerYAnchor)
        ])
    }
    
}

//MARK: - TabBarItemConstants
fileprivate enum TabBarItemConstants {
    static let animateDuration: TimeInterval = 0.2
    static let cornerRadius: CGFloat = 20
    static let tabImageHeightAnchor: CGFloat = 25
    static let tabImageWidthAnchor: CGFloat = 25
    static let newImageRightConstraints: CGFloat = -10
    static let tabImageTopAnchor: CGFloat = 10
    static let tabImageBottomAnchor: CGFloat = -10
    static let tabImageLeadingAnchor: CGFloat = 10
    static let tabTextLeadingAnchor: CGFloat = 8
    static let tabTextTrailingAnchor: CGFloat = -10
}
