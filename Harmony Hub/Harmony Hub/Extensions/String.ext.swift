//
//  String.ext.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 14.07.24.
//

import Foundation

//MARK: - Localize
extension String {
    static func localize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

//MARK: - UserInfo Keyas
extension String {
    static let state = "state"
}
