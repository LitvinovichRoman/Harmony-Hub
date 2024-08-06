//
//  Thought.swift
//  Harmony Hub
//
//  Created by Roman Litvinovich on 5.08.24.
//
//

import Foundation
import CoreData

@objc(Thought)
public class Thought: NSManagedObject {}

extension Thought {
    
    @nonobjc public class func fetchRequest() ->
    NSFetchRequest<Thought> {
         return NSFetchRequest<Thought>(entityName: "Thought")
    }
    
    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var text: String
    @NSManaged public var date: Date
    @NSManaged public var userId: String
}

extension Thought: Identifiable {
    func updateThought(newTitle: String, newText: String) {
        self.title = newTitle
        self.text = newText
        self.date = Date()
        
        try? managedObjectContext?.save()
    }
    
    func deleteThought() {
        managedObjectContext?.delete(self)
        try? managedObjectContext?.save()
    }
}

