//
//  TabBarView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit

protocol TabBarViewProtocol: AnyObject {
    func setControllers(views: [UIViewController])
}

// MARK: - Tab enums
enum Tabs: Int {
    case main
    case breath
    case thoughts
    case profile
}

final class TabBarView: UITabBarController {
    
    // MARK: - Presenter
    var presenter: TabBarPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarConfigure()
    }
}

//MARK: - Configure tabBar
extension TabBarView:  TabBarViewProtocol {
    func setControllers(views: [UIViewController]) {
        setViewControllers(views, animated: true)
    }
    
    private func tabBarConfigure() {
        tabBar.tintColor = Resources.Colors.TabBar.active
        tabBar.barTintColor = Resources.Colors.TabBar.inactive
        tabBar.backgroundColor = Resources.Colors.TabBar.barBackgroundColor
        
        tabBar.layer.cornerRadius = 40
    }

}
