//
//  thingsListApp.swift
//  thingsList
//
//  Created by 紀詠恩 on 2021/1/4.
//

import SwiftUI

@main
struct thingsListApp: App {
    
    let persistenceContainer = PersistenceController.share
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
