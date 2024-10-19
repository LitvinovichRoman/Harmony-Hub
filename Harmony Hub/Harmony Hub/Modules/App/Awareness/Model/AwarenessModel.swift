//
//  AwarenessModel.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.2024.
//

import Foundation

// MARK: - AwarenessModel Protocol
protocol AwarenessModelProtocol {
    func fetchMeditationURLs(completion: @escaping (Result<[URL], Error>) -> Void)
}

// MARK: - Final Class AwarenessModel
final class AwarenessModel {
    func fetchMeditationURLs(completion: @escaping (Result<[Meditation], Error>) -> Void) {
          FirebaseManager.shared.retrieveDataURLs(path: "meditations") { result in
              switch result {
              case .success(let urls):
                  let meditations = urls.map { Meditation(name: $0.lastPathComponent, url: $0) }
                  completion(.success(meditations))
              case .failure(let error):
                  completion(.failure(error))
              }
          }
      }
}
