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
            static var active = #colorLiteral(red: 0.631372549, green: 0.4666666667, blue: 0.4431372549, alpha: 1)
            static var inactive = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
            static var barBackground = #colorLiteral(red: 0.9142437178, green: 0.9142437178, blue: 0.9142437178, alpha: 1)
        }
    }
    
    enum Strings {
        enum TabBar {
            static var main = "Главная"
            static var breath = "Дыхание"
            static var thoughts = "Мысли"
            static var profile = "Профиль"
        }
        
        enum MainScreen {
            static var dayAdvice = "Совет дня"
            static var category = "Категори"
            static var moreButtonTitle = "Еще"
            static var categoryTitle = "Выберите категорию"
            static var posesTitle = "Выберите позу"
            static var poseScrinTittle = "Позы"
        }
        
        enum Auth {
            static var registrationTitle = "Давайте зарегистрируемся"
            static var loginTitle = "Войдите в учетную запись"
            static var loginSubTitle = "Добро пожаловать!"
            static var emailPlaceholder = "Введите email"
            static var passPlaceholder = "Введите пароль"
            static var rePassPlaceholder = "Повторите пароль"
            static var regButtonTitle = "Зарегистрироваться"
            static var logButtonTitle = "Войти"
            static var googleButtonTitle = "Войти через google"
            static var regNowSubTitle = "Нет аккаунта?"
            static var regNowButtonTitle = "Зарегистрироваться"
        }
        
        enum ThoughtsScreen {
            static var thoughtsScreenTitle = "Твои мысли"
            static var addButtonTitle = "Записать мысль"
        }
        
        enum BreathScreen {
            static var breathScreenTitle = "Контроль дыхания"
            static var startButtonTitle = "Начать"
            static var stopButtonTitle = "Остановить"
        }
        
        enum  profileScreen {
            static var logo = "Harmony Hub"
            static var logoutButtonTitle = "Выйти из профиля"
            static var projectInfoButtonTitle = "О проекте"
        }
    }
    
    enum Images {
        enum TabBar {
            static var main = #imageLiteral(resourceName: "mainTab")
            static var breath = #imageLiteral(resourceName: "breathTab")
            static var thoughts = #imageLiteral(resourceName: "breathTab")
            static var profile = #imageLiteral(resourceName: "profileTab")
        }
        
        enum Background {
            static var main = #imageLiteral(resourceName: "mainBg")
            static var breath = #imageLiteral(resourceName: "breathBg")
            static var thoughts = #imageLiteral(resourceName: "thoughtsBg")
            static var profile = #imageLiteral(resourceName: "profileBg")
        }
        
        enum Thoughts {
            static var newThought = #imageLiteral(resourceName: "newThought")
        }
    }
}

