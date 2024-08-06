//
//  ThoughtsView.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 27.06.24.
//

import UIKit

protocol ThoughtsViewProtocol: AnyObject {
    var tableView: UITableView { get set }
}

class ThoughtsView: BaseAppView, ThoughtsViewProtocol {
    // MARK: - Presenter
    var presenter: ThoughtsViewPresenterProtocol!
 
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(ThoughtCell.self, forCellReuseIdentifier: ThoughtsViewConstants.cellIdentifier)
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground(with: Resources.Backgrounds.thoughts)
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

// MARK: - Configure layout
private extension ThoughtsView {
    func configureLayout() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: UIAction(handler: { _ in
            self.presenter.showAlertWithTextFields(from: self, thought: nil)
        }))
        contentImage.addSubviews(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  ThoughtsViewConstants.tableViewBottomAnchor),
        ])
    }
}
