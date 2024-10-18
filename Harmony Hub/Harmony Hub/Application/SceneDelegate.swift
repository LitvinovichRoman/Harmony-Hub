//
//  SceneDelegate.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 11.06.24.
//

import UIKit

enum StateCase{
    case login
    case reg
    case main
}

enum Keys: String {
    case viewController
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private let authManager = AuthManager()
    private var navigationController: UINavigationController!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        NotificationCenter.default.addObserver(self, selector: #selector(setRootViewController(notification: )),
                                               name: .setRootViewController, object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        switch authManager.isLogin() {
        case true:
            window?.rootViewController = windowManager(viewController: .main)
        case false:
            window?.rootViewController = windowManager(viewController: .login)
        }
        
        window?.makeKeyAndVisible()
    }
    
    private func windowManager(viewController: StateCase) -> UIViewController {
        switch viewController {
        case .login:
            navigationController = UINavigationController(rootViewController: Builder.getLoginView())
            navigationController?.navigationBar.isHidden = true
            return navigationController
        case .reg:
            navigationController = UINavigationController(rootViewController: Builder.getRegistrationView())
            navigationController?.navigationBar.isHidden = true
            return navigationController
        case .main:
            return Builder.getTabBar()
        }
    }
    
    @objc private func setRootViewController(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let viewController = userInfo[Keys.viewController] as? StateCase else { return }
        self.window?.rootViewController = windowManager(viewController: viewController)
        self.window?.rootViewController = windowManager(viewController: viewController)
    }
    
}

