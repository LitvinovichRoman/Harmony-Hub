//
//  CategoryDetailModel.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import Foundation

enum PosesPathForSelectedCategiry {
    static let paths: [Int: String] = [
        0: "poses/1", 1: "poses/2", 2: "poses/3",
        3: "poses/4",  4: "poses/5", 5: "poses/6",
        6: "poses/7", 7: "poses/8", 8: "poses/9",
        9: "poses/10",10: "poses/11", 11: "poses/12",
        12: "poses/13", 13: "poses/14", 14: "poses/15", 
        15: "poses/16", 16: "poses/17"
    ]
}

protocol CategoryDetailModelProtocol {
    func fetchImageURLs(forCategoryAt index: Int, completion: @escaping (Result<[URL], Error>) -> Void)
}

class CategoryDetailModel: CategoryDetailModelProtocol {
    var categoryIndex: Int = 0

    func fetchImageURLs(forCategoryAt index: Int, completion: @escaping (Result<[URL], Error>) -> Void) {
        guard let path = PosesPathForSelectedCategiry.paths[index] else { return }
        FirebaseManager.shared.retrieveImageURLs(path: path) { result in
            completion(result)
        }
    }
}
