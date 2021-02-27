//
//  ContentView.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/4.
//

import SwiftUI
import CoreData

struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Task.date, ascending: true)],
//        animation: .default)
//    private var tasks: FetchedResults<Task>

    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    var body: some View {
        Home()
    }
}
