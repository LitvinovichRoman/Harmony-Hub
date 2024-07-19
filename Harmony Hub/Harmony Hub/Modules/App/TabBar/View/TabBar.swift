//
//  TabBar.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit

protocol TabBarProtocol: AnyObject {}

// MARK: - Tab enums
enum Tabs: Int {
    case main
    case breath
    case thoughts
    case profile
}

final class TabBar: UITabBarController, TabBarProtocol {
    // MARK: - Presenter
    var presenter: TabBarPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

//MARK: - Configure tabBar
private extension TabBar {
    func configure() {
        view.backgroundColor = .white
        
        tabBar.tintColor = Resources.Colors.TabBar.active
        tabBar.barTintColor = Resources.Colors.TabBar.inactive
        tabBar.backgroundColor = Resources.Colors.TabBar.barBackgroundColor

        tabBar.layer.cornerRadius = 40
        
        //MARK: -- Configure Controller
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
        
        //MARK: -- Configure Tabs
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
        
        setViewControllers([
            mainNavigationController,
            breathNavigationController,
            thoughtsNavigationController,
            profileNavigationController
        ], animated: false)
    }
}
