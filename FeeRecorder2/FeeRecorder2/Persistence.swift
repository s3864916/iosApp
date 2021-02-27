//
//  Persistence.swift
//  FeeRecorder2
//
//  Created by 紀詠恩 on 2021/1/10.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "FeeRecorder2")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError?{
                fatalError("Unresolve error: \(error)")
            }
        }
    }
}
