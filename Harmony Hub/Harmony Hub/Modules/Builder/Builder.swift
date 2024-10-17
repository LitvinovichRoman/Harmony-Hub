//
//  Builder.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

// MARK: - Final Class Builder
final class Builder {
    static func getLoginView() -> UIViewController {
        let view = LoginView()
        let presenter = LoginViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getRegistrationView() -> UIViewController {
        let view = RegistrationView()
        let presenter = RegistrationViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getTabBar() -> UIViewController {
        let view = TabBarView()
        let presenter = TabBarPresenter(view: view)
        view.presenter = presenter
       return view
    }
    
    static func getMainView() -> UIViewController {
        let view = MainView()
        let model = MainModel()
        let presenter = MainViewPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
    
    static func getCategoryDetailView(categoryIndex: Int) -> UIViewController {
        let view = CategoryDetailView()
        let model = CategoryDetailModel()
        model.categoryIndex = categoryIndex
        let presenter = CategoryDetailViewPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
    
    static func getBreathView() -> UIViewController {
        let view = BreathView()
        let presenter = BreathViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getThoughtsView() -> UIViewController {
        let view = ThoughtsView()
        let presenter = ThoughtsViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    static func getProfileView() -> UIViewController {
        let view = ProfileView()
        let presenter = ProfileViewPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
}
