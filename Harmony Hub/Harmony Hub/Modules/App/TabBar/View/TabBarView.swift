//
//  TabBarView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit
import SnapKit

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
        $0.layer.cornerRadius = TabBarViewConstants.cornerRadius
        $0.distribution = .equalSpacing
        $0.clipsToBounds = true
        $0.alignment = .center
        $0.axis = .horizontal
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

//MARK: - Configure
private extension TabBarView {
    func tabBarConfigure() {
        tabBar.isHidden = true
        tabBar.backgroundColor = TabBarViewConstants.tabBarBacgroundColor
        view.addSubviews(tabView)
        tabView.addSubviews(tabViewStack)
        setConstraints()
    }
    
    func setConstraints() {
        tabView.snp.makeConstraints {
            $0.height.equalTo(TabBarViewConstants.tabViewHeight)
            $0.leading.trailing.equalTo(view).inset(TabBarViewConstants.side)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tabViewStack.snp.makeConstraints {
            $0.top.bottom.equalTo(tabView)
            $0.leading.trailing.equalTo(tabView).inset(TabBarViewConstants.side)
        }
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
    static let side: CGFloat = 10
    static let tabViewHeight: CGFloat = 70
    static let itemOffset: Int = 0
}
