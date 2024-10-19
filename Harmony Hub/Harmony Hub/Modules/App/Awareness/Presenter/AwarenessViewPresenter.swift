//
//  AwarenessViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.24.
//

import UIKit

// MARK: - AwarenessViewPresenter Protocol
protocol AwarenessViewPresenterProtocol {
    init(view: AwarenessViewProtocol)
    func loadMeditationURLs()
    var meditations: [Meditation] { set get }
}

// MARK: - Final Class AwarenessViewPresenter
final class AwarenessViewPresenter: AwarenessViewPresenterProtocol {
    weak var view: AwarenessViewProtocol?
    var meditations: [Meditation] = []
    var model: AwarenessModel!

    required init(view: any AwarenessViewProtocol) {
        self.view = view
        self.model = AwarenessModel()
    }

    func loadMeditationURLs() {
        model.fetchMeditationURLs { [weak self] result in
            switch result {
            case .success(let meditations):
                self?.meditations = meditations
                DispatchQueue.main.async {
                    self?.view?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching meditations: \(error.localizedDescription)")
            }
        }
    }
}


