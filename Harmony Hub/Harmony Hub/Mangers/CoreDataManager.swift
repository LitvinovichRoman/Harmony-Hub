//
//  CoreDataManager.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 5.08.24.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    var thoughts = [Thought]()
    
    private init() {
        fetchAllThoughts()
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "Thought")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: -- Fetch all thoughts
    func fetchAllThoughts() {
        let req = Thought.fetchRequest()
        if let thoughts = try? persistentContainer.viewContext.fetch(req) {
            self.thoughts = thoughts
            
        }
    }
    
    //MARK: -- Add new thoughts
    func addNewThought(title: String, text: String) {
        let thought = Thought(context: persistentContainer.viewContext)
        thought.id = UUID().uuidString
        //usrId
        thought.title = title
        thought.text = text
        thought.date = Date()
        
        saveContext()
        fetchAllThoughts()
        NotificationCenter.default.post(name: .thoughtsUpdated, object: nil)
    }
}
