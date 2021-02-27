//
//  Home.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/4.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)]) var results : FetchedResults<Task>
    
    @Environment(\.managedObjectContext) var content
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
            VStack (spacing:0){
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack(alignment: .leading, spacing: 20){
                        ForEach(results) { task in
                            VStack(alignment: .leading, spacing: 5){
                                Text(task.title ?? "")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(task.date ?? Date(), style: .date)
                                    .fontWeight(.bold)
                            }
                            .foregroundColor(.black)
                            .contextMenu{
                                Button(action: {homeData.editData(item: task)}) {
                                    Text("Edit")
                                }
                                Button(action: {
                                    content.delete(task)
                                    try! content.save()}) {Text("Delete")}
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        
        
        Button(action: {homeData.isNewData.toggle()}, label: {
            Text("Add Task")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 200, height: 100, alignment: .center)
                .background(Color.blue)
        })
        .cornerRadius(30)
        .sheet(isPresented: $homeData.isNewData, content: {
            NewDataView(homeData: homeData)
        })
    }
}
