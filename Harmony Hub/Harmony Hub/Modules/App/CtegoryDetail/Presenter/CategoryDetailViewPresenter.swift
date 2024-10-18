//
//  CategoryDetailViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 31.07.24.
//

import UIKit

// MARK: - CategotyDetailViewPresenter Protocol
protocol CategotyDetailViewPresenterProtocol {
    init(view: CategoryDetailViewProtocol, model: CategoryDetailModelProtocol)
    var imageURLs: [URL] { get }
    func imageURL(at index: Int) -> URL
    func loadImageURLs()
}

// MARK: - Final Class CategoryDetailViewPresenter
final class CategoryDetailViewPresenter: CategotyDetailViewPresenterProtocol {
    weak var view: CategoryDetailViewProtocol?
    var model: CategoryDetailModelProtocol
    var imageURLs: [URL] = []
    
    required init(view: CategoryDetailViewProtocol, model: CategoryDetailModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func imageURL(at index: Int) -> URL {
        return imageURLs[index]
    }
    
    func loadImageURLs() {
        guard let categoryDetailModel = model as? CategoryDetailModel else { return }
        categoryDetailModel.fetchImageURLs(forCategoryAt: categoryDetailModel.categoryIndex) { [weak self] result in
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
}
