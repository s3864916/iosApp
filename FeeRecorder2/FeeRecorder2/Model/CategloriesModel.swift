//
//  CategloriesModel.swift
//  feeRecorder
//
//  Created by 紀詠恩 on 2020/12/20.
//

import Foundation


struct Categlorie:Hashable {
    var id:Int
    var name:String
}

class Categlories:ObservableObject{
    @Published var categlories:[Categlorie] = []
    var lastID:Int = -1
    
    private func newID() -> Int{
        lastID += 1
        return lastID - 1
}
    
    func addCateglorie(name:String){
        let newCateglorie = Categlorie(id: newID(), name: name)
        categlories.append(newCateglorie)
    }
    
    func getCateglorieInArray() -> [Categlorie] {
        var formattedCateglorie:[Categlorie] = []
        
        for item in categlories {
            formattedCateglorie.append(item)
        }
        return formattedCateglorie
    }
    
    init() {
        addCateglorie(name: "食物")
        addCateglorie(name: "飲料")
    }
}

