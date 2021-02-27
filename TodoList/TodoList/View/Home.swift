//
//  Home.swift
//  TodoList
//
//  Created by 紀詠恩 on 2021/1/8.
//

import SwiftUI

struct Home: View {
    
    @StateObject var homeData = HomeViewModel()
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var result: FetchedResults<Task>
    @Environment(\.managedObjectContext) var content

    fileprivate func deleteTask(indexset: IndexSet){
        indexset.map{ result[$0] }.forEach(content.delete)
        try! content.save()
    }
    
    var body: some View {
        VStack{
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
                VStack{
                    Text("Title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    TextEditor(text: $homeData.title)
                        .border(Color(.black))
                        .padding()
                    Divider()
                        .padding(.horizontal)
                    Text("Date")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    DatePicker("", selection: $homeData.date, in: Date()..., displayedComponents: .date)
                        .labelsHidden()
                    
                    Button(action: {
                        let newTask = Task(context: content)
                        newTask.title = homeData.title
                        newTask.date = homeData.date
                        do {
                            try content.save()
                            homeData.isNewData.toggle()
                            homeData.title = ""
                            homeData.date = Date()
                        } catch {
                            let error = error as NSError?
                            fatalError("error: \(String(describing: error))")
                        }
                    }, label: { Text("add!").font(.largeTitle)
                    })
                }
            })
            Spacer()
            List{
                ForEach(result){ task in
                    VStack{
                        Text("\(task.title ?? "unNamed")")
                        Text("\(task.date ?? Date())")
                    }
                    .contextMenu{
                        Button(action: {
                            content.delete(task)
                            try! content.save()}) {Text("Delete")}
                    }
                }
                .onDelete(perform: deleteTask)
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
