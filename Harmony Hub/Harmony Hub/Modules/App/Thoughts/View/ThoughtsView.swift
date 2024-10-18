//
//  ThoughtsView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit
import SnapKit

// MARK: - ThoughtsView Protocol
protocol ThoughtsViewProtocol: AnyObject {
    var tableView: UITableView { get set }
}

// MARK: - Final Class ThoughtsView
final class ThoughtsView: UIViewController, Backgroundable, ThoughtsViewProtocol {
    // MARK: - Properties
    var presenter: ThoughtsViewPresenterProtocol!
    
    lazy var tableView: UITableView = {
        $0.register(ThoughtCell.self, forCellReuseIdentifier: ThoughtsViewConstants.cellIdentifier)
        $0.backgroundColor = .clear
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: .zero, style: .insetGrouped))
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackground(image: Resources.Backgrounds.thoughts)
        configureLayout()
        title = Resources.Strings.ThoughtsScreen.thoughtsScreenTitle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.manager.fetchAllThoughts()
        NotificationCenter.default.addObserver(self, selector: #selector(updateTableView), name: .thoughtsUpdated, object: nil)
    }
    
    @objc func updateTableView() {
        presenter.updateTableView()
    }
}

// MARK: - TableViewDataSource & TableViewDelegate
extension ThoughtsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.manager.thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ThoughtsViewConstants.cellIdentifier, for: indexPath) as! ThoughtCell
        let thought = presenter.manager.thoughts[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ThoughtsViewConstants.dateFormat
        
        cell.titleLabel.text = thought.title
        cell.messageTextLabel.text = thought.text
        cell.dateLabel.text = dateFormatter.string(from: thought.date)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thought = presenter.manager.thoughts[indexPath.row]
        presenter.showAlertWithTextFields(from: self, thought: thought)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let thought = presenter.manager.thoughts[indexPath.row]
            thought.deleteThought()
            
            presenter.manager.thoughts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - Configure
private extension ThoughtsView {
    func configureLayout() {
        navigationItem.rightBarButtonItem = .init(systemItem: .add, primaryAction: UIAction(handler: { _ in self.presenter.showAlertWithTextFields(from: self,thought: nil) } ))
        
        view.addSubviews(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(ThoughtsViewConstants.tableViewBottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

//MARK: - ThoughtsViewConstants
fileprivate enum ThoughtsViewConstants {
    static let cellIdentifier: String = "ThoughtCell"
    static let dateFormat: String = "dd.MM.yyyy HH:mm"
    static let tableViewBottom: CGFloat = 60
}
