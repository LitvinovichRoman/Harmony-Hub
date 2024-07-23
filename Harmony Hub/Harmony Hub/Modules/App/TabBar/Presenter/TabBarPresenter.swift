//
//  TabBarPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    init(view: TabBarViewProtocol)
}

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    
    required init(view: any TabBarViewProtocol) {
        self.view = view
        setupControllers()
    }
    
    private func setupControllers() {
         lazy var mainNavigationController: UINavigationController = {
             let navigationController = UINavigationController(rootViewController: Builder.getMainView())
             return navigationController
         }()

         lazy var breathNavigationController: UINavigationController = {
             let navigationController = UINavigationController(rootViewController: Builder.getBreathView())
             return navigationController
         }()

         lazy var thoughtsNavigationController: UINavigationController = {
             let navigationController = UINavigationController(rootViewController: Builder.getThoughtsView())
             return navigationController
         }()

         lazy var profileNavigationController: UINavigationController = {
             let navigationController = UINavigationController(rootViewController: Builder.getProfileView())
             return navigationController
         }()
        
         
         mainNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.main,
                                                  image: Resources.Icons.TabBar.main,
                                                  tag: Tabs.main.rawValue)
         
         breathNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.breath,
                                                  image: Resources.Icons.TabBar.breath,
                                                  tag: Tabs.breath.rawValue)
         
         thoughtsNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.thoughts,
                                                  image: Resources.Icons.TabBar.thoughts,
                                                  tag: Tabs.thoughts.rawValue)
         
         profileNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.profile,
                                                  image: Resources.Icons.TabBar.profile,
                                                  tag: Tabs.profile.rawValue)
        
        view?.setControllers(views: [ 
            mainNavigationController,
            breathNavigationController,
            thoughtsNavigationController,
            profileNavigationController])
     }
}
