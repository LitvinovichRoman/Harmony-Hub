//
//  TabBarPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 1.08.24.
//

import UIKit

// MARK: - TabBarPresenter Protocol
protocol TabBarPresenterProtocol {
    init(view: TabBarViewProtocol)
    func createTabItems() -> [TabItem]
}

// MARK: - Final Class TabBarPresenter
final class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    var tabItems: [TabItem] = []
    
    required init(view: any TabBarViewProtocol) {
        self.view = view
        setupControllers()
    }
    
    func createTabItems() -> [TabItem] {
        tabItems = [
            TabItem(index: 0, tabText: Resources.Strings.TabBar.main, tabImage: Resources.Icons.TabBar.main),
            TabItem(index: 1, tabText: Resources.Strings.TabBar.breath, tabImage: Resources.Icons.TabBar.breath),
            TabItem(index: 2, tabText: Resources.Strings.TabBar.thoughts, tabImage: Resources.Icons.TabBar.thoughts),
            TabItem(index: 3, tabText: Resources.Strings.TabBar.profile, tabImage: Resources.Icons.TabBar.profile)
        ]
        
        return tabItems
    }
    
    func setupControllers() {
        let mainView = UINavigationController(rootViewController: Builder.getMainView())
        let breathView = UINavigationController(rootViewController: Builder.getBreathView())
        let thoughtsView = UINavigationController(rootViewController: Builder.getThoughtsView())
        let profileView =  UINavigationController(rootViewController: Builder.getProfileView())
        
        let controllers = [mainView, breathView, thoughtsView, profileView]
        controllers.forEach {
            $0.navigationBar.tintColor = .black
        }
        
        view?.setControllers(views: controllers)
    }
}


