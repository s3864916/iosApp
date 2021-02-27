//
//  CoreDataToDoApp.swift
//  CoreDataToDo
//
//  Created by 紀詠恩 on 2020/12/31.
//

import SwiftUI

@main
struct CoreDataToDoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup<ContentView> {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
