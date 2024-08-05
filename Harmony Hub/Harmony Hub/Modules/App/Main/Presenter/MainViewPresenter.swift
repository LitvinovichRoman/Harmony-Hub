//
//  MainViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol MainViewPresenterProtocol {
    var imageURLs: [URL] { get }
    func imageURL(at index: Int) -> URL?
    func loadImageURLs()
    func showDailyTip()
}

class MainViewPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    var model: MainModelProtocol
    var imageURLs: [URL] = []
    
    required init(view: MainViewProtocol, model: MainModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func loadImageURLs() {
        model.fetchImageURLs { [weak self] result in
            switch result {
            case .success(let urls):
                self?.imageURLs = urls.sorted(by: { $0.absoluteString < $1.absoluteString })
                DispatchQueue.main.async {
                    self?.view?.collectionView.reloadData()
                }
            case .failure(let error):
                print("Error fetching image URLs: \(error.localizedDescription)")
            }
        }
    }
    
    func showDailyTip() {
        model.fetchDailyTip { [weak self] tip in
            DispatchQueue.main.async {
                self?.view?.tipOfTheDayLabel.text = tip ?? "No tip for today"
            }
        }
    }
    
    func imageURL(at index: Int) -> URL? {
            guard index < imageURLs.count else { return nil }
            return imageURLs[index]
        }
}
