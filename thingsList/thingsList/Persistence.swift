//
//  Persistence.swift
//  thingsList
//
//  Created by 紀詠恩 on 2021/1/4.
//

import CoreData

struct PersistenceController {
    static let share = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoList")
        
        container.loadPersistentStores { (NSPersistentStoreDescription, error) in
            if let error = error as NSError?{
                fatalError("Error Occur: \(error)")
            }
        }
    }
}
