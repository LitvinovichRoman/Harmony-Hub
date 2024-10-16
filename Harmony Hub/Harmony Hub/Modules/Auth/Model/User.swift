//
//  User.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 15.10.2024.
//

import Foundation

// MARK: - User
struct User {
    var id: String = UUID().uuidString
    let email: String
    let password: String
    var name: String?
}
