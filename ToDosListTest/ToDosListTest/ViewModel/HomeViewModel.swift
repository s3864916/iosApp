//
//  HomeViewModel.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/4.
//

import Foundation
import CoreData

class HomeViewModel : ObservableObject{
    @Published var title = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
    @Published var updatedData: Task!
    
    let calender = Calendar.current
    
    func checkDate()->String{
        if calender.isDateInToday(date){ return "Today"}
        else if calender.isDateInTomorrow(date){ return "Tomorrow"}
        else {return "Other day"}
    }
    
    func updateDate(value:String) {
        if value == "Today" {date = Date() }
        else if value == "Tomorrow" {date = calender.date(byAdding: .day, value: 1, to: Date())!}
        else {}
    }
    
    func writeData(content: NSManagedObjectContext){
        
        if updatedData != nil{
            updatedData.date = date
            updatedData.title = title

            do {
                try content.save()
                updatedData = nil
                isNewData.toggle()
            } catch {
                let error = error as NSError?
                fatalError("error: \(String(describing: error))")
            }
            
        }else{
            let newTask = Task(context: content)
            newTask.date = date
            newTask.title = title
            
            do {
                try content.save()
                isNewData.toggle()
                title = ""
                date = Date()
            } catch {
                let error = error as NSError?
                fatalError("error: \(String(describing: error))")
            }
        }
    }
    
    func editData(item: Task){
        updatedData = item
        title = item.title!
        date = item.date!
        isNewData.toggle()
    }
}
