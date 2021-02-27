//
//  Persistence.swift
//  TodoList
//
//  Created by 紀詠恩 on 2021/1/8.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoList")
        container.loadPersistentStores(completionHandler:{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
