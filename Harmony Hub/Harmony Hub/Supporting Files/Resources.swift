//
//  Resources.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit


enum Resources {
    //MARK: -- Resources[Strings]
    enum Strings {
        enum TabBar {
            static let main: String = .localize("main")
            static let breath: String = .localize("breath")
            static let thoughts: String = .localize("thoughts")
            static let profile: String = .localize("profile")
        }
        
        enum MainScreen {
            static let dayAdvice: String = .localize("dayAdvice")
            static let category: String = .localize("category")
            static let greetings: String = .localize("greetings")
            static let tipOfTheDayText: String = .localize("tipOfTheDayText")
            static let moreButtonTitle: String = .localize("moreButtonTitle")
            static let categoryTitle: String = .localize("categoryTitle")
            static let posesTitle: String = .localize("posesTitle")
            static let poseScreenTittle: String = .localize("poseScreenTittle")
        }
        
        enum Auth {
            static let registrationTitle: String = .localize("registrationTitle")
            static let loginTitle: String = .localize("loginTitle")
            static let namePlaceholder: String = .localize("namePlaceholder")
            static let emailPlaceholder: String = .localize("emailPlaceholder")
            static let passPlaceholder: String = .localize("passPlaceholder")
            static let regButtonTitle: String = .localize("regButtonTitle")
            static let logButtonTitle: String = .localize("logButtonTitle")
        }
        
        enum ThoughtsScreen {
            static let thoughtsScreenTitle: String = .localize("thoughtsScreenTitle")
            static let addButtonTitle: String = .localize("addButtonTitle")
            static let titleFieldPlaceholder: String = .localize("titleFieldPlaceholder")
            static let textFieldPlaceholder: String = .localize("textFieldPlaceholder")
            static let thoughtsAlertTitle: String = .localize("thoughtsAlertTitle")
            static let thoughtsCancelAction: String = .localize("thoughtsCancelAction")
            static let thoughtsSaveAction: String = .localize("thoughtsSaveAction")
        }
        
        enum BreathScreen {
            static let breathScreenTitle: String = .localize("breathScreenTitle")
            static let startButtonTitle: String = .localize("startButtonTitle")
            static let stopButtonTitle: String = .localize("stopButtonTitle")
        }
        
        enum ProfileScreen {
            static let logo: String = .localize("logo")
            static let logoutButtonTitle: String = .localize("logoutButtonTitle")
            static let projectInfoButtonTitle: String = .localize("projectInfoButtonTitle")
        }
    }
    
    //MARK: -- Resources[Backgrounds]
    enum Backgrounds {
        static let main = #imageLiteral(resourceName: "mainBg")
        static let breath = #imageLiteral(resourceName: "breathBg")
        static let thoughts = #imageLiteral(resourceName: "thoughtsBg")
        static let profile = #imageLiteral(resourceName: "profileBg")
        static let login = #imageLiteral(resourceName: "loginViewBg")
        static let registration = #imageLiteral(resourceName: "registrationViewBg")
    }
    
    //MARK: -- Resources[Icons]
    enum Icons {
        enum TabBar {
            static let main = #imageLiteral(resourceName: "mainTab")
            static let breath = #imageLiteral(resourceName: "breathTab")
            static let thoughts = #imageLiteral(resourceName: "thoughtsTab")
            static let profile = #imageLiteral(resourceName: "profileTab")
        }
        
        enum Thoughts {
            static let newThought = #imageLiteral(resourceName: "newThought")
        }
        
        enum Auth {
            static let googleButton = #imageLiteral(resourceName: "googleButton")
        }
    }
    
    //MARK: -- Resources[Colors]
    enum Colors {
        enum App {
            static let borderColor = #colorLiteral(red: 0.631372549, green: 0.4666666667, blue: 0.4431372549, alpha: 1)
            static let accent = #colorLiteral(red: 0.8588235294, green: 0.8509803922, blue: 0.7960784314, alpha: 1)
            static let subBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        enum TabBar {
            static let active = #colorLiteral(red: 0.8659283669, green: 0.8659283669, blue: 0.8659283669, alpha: 1)
            static let inactive: UIColor = .clear
        }
        
        enum Auth {
            static let titleLabelColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            static let bottomButtonTitleColor = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
            static let textFieldBackgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let textFieldTextColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            static let mainButtonBackgroundColor = #colorLiteral(red: 0.631372549, green: 0.4666666667, blue: 0.4431372549, alpha: 1)
            static let mainButtonTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

