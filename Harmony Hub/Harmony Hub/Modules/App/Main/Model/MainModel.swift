//
//  MainModel.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import Foundation

// MARK: - MainModel Protocol
protocol MainModelProtocol {
    func fetchImageURLs(completion: @escaping (Result<[URL], Error>) -> Void)
    func fetchDailyTip(completion: @escaping (String?) -> Void)
}

// MARK: - Final Class MainModel
final class MainModel: MainModelProtocol {
    func fetchImageURLs(completion: @escaping (Result<[URL], Error>) -> Void) {
        FirebaseManager.shared.retrieveImageURLs(path: "categories") { result in
            completion(result)
        }
    }
    
    func fetchDailyTip(completion: @escaping (String?) -> Void) {
        FirebaseManager.shared.fetchDailyTip { tip in
            completion(tip)
        }
    }
}

