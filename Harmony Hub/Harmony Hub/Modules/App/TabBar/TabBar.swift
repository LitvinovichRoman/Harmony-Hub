//
//  TabBar.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit

// MARK: - Tab enums
enum Tabs: Int {
    case main
    case breath
    case thoughts
    case profile
}

final class TabBar: UITabBarController {
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
        tabBar.backgroundColor = Resources.Colors.TabBar.barBackground

        tabBar.layer.cornerRadius = 40

        lazy var mainNavigationController: UINavigationController = {
            let navigationController = UINavigationController(rootViewController: MainView())
            return navigationController
        }()

        lazy var breathNavigationController: UINavigationController = {
            let navigationController = UINavigationController(rootViewController: BreathView())
            return navigationController
        }()

        lazy var thoughtsNavigationController: UINavigationController = {
            let navigationController = UINavigationController(rootViewController: ThoughtsView())
            return navigationController
        }()

        lazy var profileNavigationController: UINavigationController = {
            let navigationController = UINavigationController(rootViewController: ProfileView())
            return navigationController
        }()
        
        mainNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.main,
                                                 image: Resources.Images.TabBar.main,
                                                 tag: Tabs.main.rawValue)
        
        breathNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.breath,
                                                 image: Resources.Images.TabBar.breath,
                                                 tag: Tabs.breath.rawValue)
        
        thoughtsNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.thoughts,
                                                 image: Resources.Images.TabBar.thoughts,
                                                 tag: Tabs.thoughts.rawValue)
        
        profileNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.profile,
                                                 image: Resources.Images.TabBar.profile,
                                                 tag: Tabs.profile.rawValue)
        
        setViewControllers([
            mainNavigationController,
            breathNavigationController,
            thoughtsNavigationController,
            profileNavigationController
        ], animated: false)
    }
}
