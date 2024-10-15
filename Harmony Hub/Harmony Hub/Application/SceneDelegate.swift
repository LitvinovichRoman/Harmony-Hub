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
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        NotificationCenter.default.addObserver(self, selector: #selector(setRootViewController(notification: )),
                                               name: .setRootViewController, object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = windowManager(viewController: .main)
        window?.makeKeyAndVisible()
    }
    
    private func windowManager(viewController: StateCase) -> UIViewController {
        switch viewController {
        case .login:
            return Builder.getLoginView()
        case .reg:
            return Builder.getRegistrationView()
        case .main:
            return Builder.getTabBar()
        }
    }
    
    @objc private func setRootViewController(notification: Notification) {
        guard let userInfo = notification.userInfo,
              let viewController = userInfo[Keys.viewController] as? StateCase else { return }
        self.window?.rootViewController = windowManager(viewController: viewController)
    }
    
}

