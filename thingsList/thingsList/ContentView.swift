//
//  ContentView.swift
//  thingsList
//
//  Created by 紀詠恩 on 2021/1/4.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    
    var tasks : FetchedResults<Task>
    
    fileprivate func saveContext() {
        do{
            try viewContext.save()
        }catch{
            let error = error as NSError
            fatalError("error occur: \(error)")
        }
    }
    
    fileprivate func addTask() {
        let newTask = Task(context: viewContext)
        newTask.date = Date()
        newTask.title = "newTask \(Date())"
        saveContext()
    }
    
    fileprivate func deleteTask(indexset: IndexSet){
        indexset.map{ tasks[$0] }.forEach(viewContext.delete)
        saveContext()
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks){task in
                    Text(task.title ?? "unknoew")
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("做事")
            .navigationBarItems(trailing: Button("addTask"){
                addTask()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
