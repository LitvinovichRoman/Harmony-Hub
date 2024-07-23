//
//  SceneDelegate.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 11.06.24.
//

import UIKit

enum WindowManager {
    case login
    case registration
    case app
}

enum UserInfoKeys: String {
    case state
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        NotificationCenter.default.addObserver(self, selector: #selector(windowManager(notification: )),
                                               name: .windowManager, object: nil)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = Builder.getTabBar()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    @objc
    private func windowManager(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any] else { return }
        guard let state = userInfo[.state] as? WindowManager else { return }
        
        switch state {
        case .login:
            window?.rootViewController = Builder.getLoginView()
        case .registration:
            window?.rootViewController = Builder.getRegistrationView()
        case .app:
            window?.rootViewController = Builder.getTabBar()
        }
    }
    
}

