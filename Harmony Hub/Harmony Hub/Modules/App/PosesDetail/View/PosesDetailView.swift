//
//  PosesDetailView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 18.10.2024.
//

import UIKit

// MARK: - PosesDetailView Protocol
protocol PosesDetailViewProtocol: AnyObject {
    
}
// MARK: - Final Class PosesDetailView
final class PosesDetailView: UIViewController, PosesDetailViewProtocol, Backgroundable {
    
    var presenter: PosesDetailViewPresenterProtocol!

    // MARK: -- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.main)
    }
    
}
