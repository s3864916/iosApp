//
//  HomeViewModel.swift
//  TodoList
//
//  Created by 紀詠恩 on 2021/1/8.
//

import Foundation
import CoreData

class HomeViewModel: ObservableObject {
    @Published var title = ""
    @Published var date = Date()
    
    @Published var isNewData = false
    
    let calender = Calendar.current
    
    func addTask(){
        
    }
}
