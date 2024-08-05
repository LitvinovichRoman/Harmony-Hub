//
//  TabBarItem.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

class TabBarItem: UIView {
    //MARK: -- Properties
    var tabItem: TabItem
    var imageRightConstraints: NSLayoutConstraint?
    var isSelected: (TabBarItem) -> Void
    var isActive: Bool {
        willSet  {
            self.imageRightConstraints?.isActive = !newValue
            self.contentView.backgroundColor = newValue ? Resources.Colors.TabBar.active: Resources.Colors.TabBar.inactive
            UIView.animate(withDuration: TabBarItemConstant.animateDuration) { self.layoutIfNeeded() } } }
    
    //MARK: -- Properties[Lazy]
    lazy var contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = isActive ? Resources.Colors.TabBar.active: Resources.Colors.TabBar.inactive
        $0.layer.cornerRadius = TabBarItemConstant.cornerRadius
        $0.addSubviews(tabImage, tabText)
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapToTab)))
        return $0
    }(UIView())
    
    lazy var tabImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = tabItem.tabImage
        $0.heightAnchor.constraint(equalToConstant: TabBarItemConstant.tabImageHeightAnchor).isActive = true
        $0.widthAnchor.constraint(equalToConstant: TabBarItemConstant.tabImageWidthAnchor).isActive = true
        return $0
    }(UIImageView())
    
    lazy var tabText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = tabItem.tabText
        $0.textColor = .black
        return $0
    }(UILabel())
    
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
    
    @objc func tapToTab() {
        self.isSelected(self)
    }
}
    
    

extension TabBarItem {
    private func configureLayout() {
        addSubviews(contentView)
        
        imageRightConstraints = tabImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:  TabBarItemConstant.newImageRightConstraints)
        imageRightConstraints?.isActive = !isActive
        
        makeContentViewConstarint()
        makeTabImageConstarint()
        makeTabTextConstarint()
    }
    
    private func makeContentViewConstarint() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func makeTabImageConstarint() {
        NSLayoutConstraint.activate([
            tabImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: TabBarItemConstant.tabImageTopAnchor),
            tabImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: TabBarItemConstant.tabImageLeadingAnchor),
            tabImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: TabBarItemConstant.tabImageBottomAnchor),
        ])
    }
    
    private func makeTabTextConstarint() {
        NSLayoutConstraint.activate([
            tabText.leadingAnchor.constraint(equalTo: tabImage.trailingAnchor, constant: TabBarItemConstant.tabTextLeadingAnchor),
            tabText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: TabBarItemConstant.tabTextTrailingAnchor),
            tabText.centerYAnchor.constraint(equalTo: tabImage.centerYAnchor)
        ])
    }
    
}

