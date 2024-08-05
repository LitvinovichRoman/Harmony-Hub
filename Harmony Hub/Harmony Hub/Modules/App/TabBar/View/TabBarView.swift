//
//  TabBarView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

class TabBarView: UITabBarController {
    
    //MARK: -- Presenter
    var presenter: TabBarPresenterProtocol!
    
    //MARK: -- Properties
    var tabView = TabView()
    
    lazy var tabViewStack: UIStackView = {
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
}

//MARK: -- Configure Layout
extension TabBarView:  TabBarViewProtocol {
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
    }
    
    private func tabBarConfigure() {
        tabBar.isHidden = true
        tabBar.backgroundColor = TabBarViewConstants.tabBarBacgroundColor
        view.addSubviews(tabView)
        tabView.addSubviews(tabViewStack)
        setConstraints()
    }
    
    private func setConstraints() {
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
    
    private func configureTabBar(pages: [TabItem]) {
        pages.enumerated().forEach { item in
            if item.offset == TabBarViewConstants.itemOffset {  tabViewStack.addArrangedSubview(createTab(item: item.element, isFirst: true)) }
            else {  tabViewStack.addArrangedSubview(createTab(item: item.element, isFirst: false)) }
        }
    }
    
    private func createTab(item: TabItem, isFirst: Bool = false) -> UIView {
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

//#Preview() {
//    TabBarView()
//}
