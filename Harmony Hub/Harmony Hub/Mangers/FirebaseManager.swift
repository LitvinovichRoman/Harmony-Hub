//
//  FirebaseManager.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 25.07.24.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

// MARK: - Final Class FirebaseManager
final class FirebaseManager {
    // MARK: -- Properties
    static let shared = FirebaseManager()
    let storage = Storage.storage()
    let db = Firestore.firestore()
    
    // MARK: -- Image Retrieval
    func retrieveImageURLs(path: String, completion: @escaping (Result<[URL], Error>) -> Void) {
        let posesRef = storage.reference().child(path)
        
        posesRef.listAll { (result, error) in
            if let error = error {
                completion(.failure(error))
            } else if let result = result {
                var urls: [URL] = []
                let dispatchGroup = DispatchGroup()
                
                for item in result.items {
                    dispatchGroup.enter()
                    item.downloadURL { url, error in
                        if let error = error {
                            print("Error getting download URL: \(error)")
                        } else if let url = url {
                            urls.append(url)
                        }
                        dispatchGroup.leave()
                    }
                }
                
                dispatchGroup.notify(queue: .main) {
                    completion(.success(urls))
                }
            }
        }
    }
    
    // MARK: -- Fetch Daily Tip
    func fetchDailyTip(completion: @escaping (String?) -> Void) {
        db.collection("tips").document("dailyTips").getDocument { document, error in
            if let document = document, document.exists {
                let data = document.data()
                let tips = data?["tipsArray"] as? [String] ?? []
                
                if !tips.isEmpty {
                    let randomIndex = Int(arc4random_uniform(UInt32(tips.count)))
                    let tip = tips[randomIndex]
                    completion(tip)
                } else { completion(nil) } }
            else { completion(nil) }
        }
    }
    
    // MARK: -- Fetch Name
    func fetchName(completion: @escaping (String?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }
        
        db.collection("users").document(userId).getDocument { document, error in
            if error != nil { completion(nil) }
            else if let document = document, document.exists {
                let data = document.data()
                let name = data?["name"] as? String
                completion(name)
            }
            else { completion(nil) }
        }
    }
    
}
