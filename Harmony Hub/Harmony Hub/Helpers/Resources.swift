//
//  Resources.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit

enum Resources {
    enum Colors {
        enum TabBar {
            static var active = UIColor(named: "active")
            static var inactive = UIColor(named: "inactive")
        }
    }
    
    enum Strings {
        enum TabBar {
            static var main = "Главная"
            static var breath = "Дыхание"
            static var thoughts = "Мысли"
            static var profile = "Профиль"
        }
        
        enum HomeScreen {
            static var dayAdvice = "Совет дня"
            static var category = "Категори"
        }
    }

    enum Images {
        enum TabBar {
            static var main = UIImage(named: "mainTab")
            static var breath = UIImage(named: "breathTab")
            static var thoughts = UIImage(named: "thoughtsTab")
            static var profile = UIImage(named: "profileTab")
        }
    }

}

