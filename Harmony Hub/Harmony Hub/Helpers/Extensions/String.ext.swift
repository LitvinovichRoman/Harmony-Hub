//
//  String.ext.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 14.07.24.
//

import Foundation

extension String {
    static func localize(_ text: String.LocalizationValue) -> String {
        String(localized: text)
    }
}

