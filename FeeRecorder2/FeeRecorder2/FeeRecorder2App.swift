//
//  FeeRecorder2App.swift
//  FeeRecorder2
//
//  Created by 紀詠恩 on 2020/12/23.
//

import SwiftUI

@main
struct FeeRecorder2App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
