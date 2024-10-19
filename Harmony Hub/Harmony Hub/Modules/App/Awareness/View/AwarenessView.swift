//
//  AwarenessView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 19.10.24.
//

import UIKit
import SpriteKit

// MARK: - AwarenessView Protocol
protocol AwarenessViewProtocol: AnyObject {
    var tableView: UITableView { get }
}

// MARK: - Final Class AwarenessView
final class AwarenessView: UIViewController, Backgroundable, AwarenessViewProtocol {
    var presenter: AwarenessViewPresenterProtocol!
    
    lazy var tableView: UITableView = {
        $0.register(MeditationCell.self, forCellReuseIdentifier: MeditationCell.reuseIdentifier)
        $0.backgroundColor = .clear
        $0.allowsSelection = false
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: .zero, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.awareness)
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadMeditationURLs()
    }
    
    private func configure() {
        title = Resources.Strings.AwarenessScreen.awarenessScreenTitle
       
        view.addSubviews(tableView)
        tableView.snp.makeConstraints {
            $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDataSource
extension AwarenessView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.meditations.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MeditationCell.reuseIdentifier, for: indexPath) as? MeditationCell else {
            return UITableViewCell()
        }
        
        let meditation = presenter.meditations[indexPath.row]
        cell.configure(with: meditation)
        return cell
    }
}
