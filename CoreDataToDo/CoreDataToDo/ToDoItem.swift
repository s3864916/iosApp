//
//  ToDoItem.swift
//  CoreDataToDo
//
//  Created by 紀詠恩 on 2020/12/31.
//

import CoreData

public class ToDoItem:NSManagedObject, Identifiable {
    @NSManaged public var title:String?
    @NSManaged public var createdAt:Date?
}

extension ToDoItem{
    static func getAllToDoItems() -> NSFetchRequest<ToDoItem> {
        let request:NSFetchRequest<ToDoItem> = ToDoItem.fetchRequest() as! NSFetchRequest<ToDoItem>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
