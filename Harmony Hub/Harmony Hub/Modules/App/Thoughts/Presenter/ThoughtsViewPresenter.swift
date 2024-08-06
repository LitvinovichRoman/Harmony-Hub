//
//  ThoughtsViewPresenter.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 16.07.24.
//

import UIKit

protocol ThoughtsViewPresenterProtocol: AnyObject {
    init(view: ThoughtsViewProtocol)
    var manager: CoreDataManager { get set }
    func showAlertWithTextFields(from viewController: UIViewController, thought: Thought?) -> Void
    func updateTableView() -> Void
}

class ThoughtsViewPresenter: ThoughtsViewPresenterProtocol {
    var manager = CoreDataManager.shared
    
    weak var view: ThoughtsViewProtocol?
    
    required init(view: ThoughtsViewProtocol) {
        self.view = view
    }
    
    func showAlertWithTextFields(from viewController: UIViewController, thought: Thought?) {
        let alertController = UIAlertController(title: Resources.Strings.ThoughtsScreen.thoughtsAlertTitle, message: "", preferredStyle: .alert)
        alertController.addTextField { titleField in
            titleField.placeholder = Resources.Strings.ThoughtsScreen.titleFieldPlaceholder
            titleField.keyboardType = .default
            titleField.text = thought?.title
        }
        
        alertController.addTextField { textField in
            textField.placeholder = Resources.Strings.ThoughtsScreen.textFieldPlaceholder
            textField.keyboardType = .default
            textField.text = thought?.text
        }
        
        let cancelAction = UIAlertAction(title: Resources.Strings.ThoughtsScreen.thoughtsCancelAction, style: .cancel)
        
        let saveAction = UIAlertAction(title: Resources.Strings.ThoughtsScreen.thoughtsSaveAction, style: .default) { _ in
            guard let titleText = alertController.textFields?[0].text,
                  let thoughtText = alertController.textFields?[1].text else { return }
            
            if let thought = thought { thought.updateThought(newTitle: titleText, newText: thoughtText) }
            else {  self.manager.addNewThought(title: titleText, text: thoughtText) }
            self.updateTableView()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        viewController.present(alertController, animated: true)
    }
    
    func updateTableView() {
        manager.fetchAllThoughts()
        view?.tableView.reloadData()
    }
}
