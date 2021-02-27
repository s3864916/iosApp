//
//  pasteBoardTestApp.swift
//  pasteBoardTest
//
//  Created by 紀詠恩 on 2020/12/21.
//

import SwiftUI

@main
struct pasteBoardTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(saveTexts: SaveTexts())
        }
    }
}
