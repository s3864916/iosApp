//
//  ToDosListTestApp.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/4.
//

import SwiftUI

@main
struct ToDosListTestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
