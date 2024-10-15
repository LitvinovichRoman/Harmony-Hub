//
//  TabBarView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit

// MARK: - TabBarView Protocol
protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

// MARK: - Final Class TabBarView
final class TabBarView: UITabBarController, TabBarViewProtocol {
    //MARK: -- Properties
    var presenter: TabBarPresenterProtocol!
    private  var tabView = TabView()
    
    private lazy var tabViewStack: UIStackView = {
        $0.backgroundColor = TabBarViewConstants.tabViewStackBacgroundColor
        $0.clipsToBounds = true
        $0.layer.cornerRadius = TabBarViewConstants.cornerRadius
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        return $0
    }(UIStackView())
    
    //MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfigure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTabBar(pages: presenter.createTabItems())
    }
    
    // MARK: -- setControllers
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
    }
}

//MARK: -- Configure
private extension TabBarView {
    func tabBarConfigure() {
        tabBar.isHidden = true
        tabBar.backgroundColor = TabBarViewConstants.tabBarBacgroundColor
        view.addSubviews(tabView)
        tabView.addSubviews(tabViewStack)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: TabBarViewConstants.tabViewLeadingAnchor),
            tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: TabBarViewConstants.tabViewTrailingAnchor),
            tabView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tabView.heightAnchor.constraint(equalToConstant: TabBarViewConstants.tabViewHeightAnchor),
            
            tabViewStack.topAnchor.constraint(equalTo: tabView.topAnchor),
            tabViewStack.bottomAnchor.constraint(equalTo: tabView.bottomAnchor),
            tabViewStack.leadingAnchor.constraint(equalTo: tabView.leadingAnchor, constant: TabBarViewConstants.tabViewStackLeadingAnchor),
            tabViewStack.trailingAnchor.constraint(equalTo: tabView.trailingAnchor, constant: TabBarViewConstants.tabViewStackTrailingAnchor)
            
        ])
    }
    
    func configureTabBar(pages: [TabItem]) {
        pages.enumerated().forEach { item in
            if item.offset == TabBarViewConstants.itemOffset {  tabViewStack.addArrangedSubview(createTab(item: item.element, isFirst: true)) }
            else {  tabViewStack.addArrangedSubview(createTab(item: item.element, isFirst: false)) }
        }
    }
    
    func createTab(item: TabItem, isFirst: Bool = false) -> UIView {
        TabBarItem(tabItem: item, isActive: isFirst) { [weak self] selectedItem in
            guard let self = self else { return }
            self.tabViewStack.arrangedSubviews.forEach {
                guard let tabItem = $0 as? TabBarItem else { return }
                tabItem.isActive = false
            }
            
            selectedItem.isActive.toggle()
            self.selectedIndex = item.index
        }
    }
}

//MARK: - TabBarViewConstants
fileprivate enum TabBarViewConstants {
    static let cornerRadius: CGFloat = 35
    static let tabBarBacgroundColor: UIColor = .white.withAlphaComponent(0.5)
    static let tabViewStackBacgroundColor: UIColor = .white
    static let tabViewLeadingAnchor: CGFloat = 10
    static let tabViewTrailingAnchor: CGFloat = -10
    static let tabViewHeightAnchor: CGFloat = 70
    static let tabViewStackLeadingAnchor: CGFloat = 10
    static let tabViewStackTrailingAnchor: CGFloat = -10
    static let itemOffset: Int = 0
}
