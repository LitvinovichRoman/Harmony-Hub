//
//  Resources.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 20.06.24.
//

import UIKit

enum Resources {
    enum Strings {
        enum TabBar {
            static var main: String = .localize("main")
            static var breath: String = .localize("breath")
            static var thoughts: String = .localize("thoughts")
            static var profile: String = .localize("profile")
        }
        
        enum MainScreen {
            static var dayAdvice: String = .localize("dayAdvice")
            static var category: String = .localize("category")
            static var moreButtonTitle: String = .localize("moreButtonTitle")
            static var categoryTitle: String = .localize("categoryTitle")
            static var posesTitle: String = .localize("posesTitle")
            static var poseScreenTittle: String = .localize("poseScreenTittle")
        }
        
        enum Auth {
            static var registrationTitle: String = .localize("registrationTitle")
            static var loginTitle: String = .localize("loginTitle")
            static var loginSubTitle: String = .localize("loginSubTitle")
            static var emailPlaceholder: String = .localize("emailPlaceholder")
            static var passPlaceholder: String = .localize("passPlaceholder")
            static var rePassPlaceholder: String = .localize("rePassPlaceholder")
            static var regButtonTitle: String = .localize("regButtonTitle")
            static var logButtonTitle: String = .localize("logButtonTitle")
            static var googleButtonTitle: String = .localize("googleButtonTitle")
            static var regNowSubTitle: String = .localize("regNowSubTitle")
            static var regNowButtonTitle: String = .localize("regNowButtonTitle")
        }
        
        enum ThoughtsScreen {
            static var thoughtsScreenTitle: String = .localize("thoughtsScreenTitle")
            static var addButtonTitle: String = .localize("addButtonTitle")
        }
        
        enum BreathScreen {
            static var breathScreenTitle: String = .localize("breathScreenTitle")
            static var startButtonTitle: String = .localize("startButtonTitle")
            static var stopButtonTitle: String = .localize("stopButtonTitle")
        }
        
        enum ProfileScreen {
            static var logo: String = .localize("logo") }
        static var logoutButtonTitle: String = .localize("logoutButtonTitle")
        static var projectInfoButtonTitle: String = .localize("projectInfoButtonTitle")
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
    
    enum Colors {
        enum TabBar {
            static var active = #colorLiteral(red: 0.631372549, green: 0.4666666667, blue: 0.4431372549, alpha: 1)
            static var inactive = #colorLiteral(red: 0.5019607843, green: 0.5019607843, blue: 0.5019607843, alpha: 1)
            static var barBackground = #colorLiteral(red: 0.9142437178, green: 0.9142437178, blue: 0.9142437178, alpha: 1)
        }
    }
}

