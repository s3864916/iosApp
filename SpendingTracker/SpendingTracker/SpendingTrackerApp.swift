//
//  SpendingTrackerApp.swift
//  SpendingTracker
//
//  Created by 紀詠恩 on 2021/2/17.
//

import SwiftUI

@main
struct SpendingTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
