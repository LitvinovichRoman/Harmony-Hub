//
//  Builder.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - Final Class Builder
final class Builder {
    // Login
    static func getLoginView() -> UIViewController {
        let view = LoginView()
        let presenter = LoginViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // Registration
    static func getRegistrationView() -> UIViewController {
        let view = RegistrationView()
        let presenter = RegistrationViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // TabBar
    static func getTabBar() -> UIViewController {
        let view = TabBarView()
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter
       return view
    }
    
    // Main
    static func getMainView() -> UIViewController {
        let view = MainView()
        let model = MainModel()
        let presenter = MainViewPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
    
    // CategoryDetail
    static func getCategoryDetailView(categoryIndex: Int) -> UIViewController {
        let view = CategoryDetailView()
        let model = CategoryDetailModel()
        model.categoryIndex = categoryIndex
        let presenter = CategoryDetailViewPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
     
    // PosesDetail
    static func getPosesDetailView() -> UIViewController {
        let view = PosesDetailView()
        let presenter = PosesDetailViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // Awareness
    static func getAwarenessView() -> UIViewController {
        let view = AwarenessView()
        let presenter = AwarenessViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // Thoughts
    static func getThoughtsView() -> UIViewController {
        let view = ThoughtsView()
        let presenter = ThoughtsViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    // Profile
    static func getProfileView() -> UIViewController {
        let view = ProfileView()
        let presenter = ProfileViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}
