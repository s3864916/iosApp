//
//  SpendModel.swift
//  feeRecorder
//
//  Created by 紀詠恩 on 2020/12/17.
//

import Foundation
import Combine

struct Spending:Identifiable{
    var id:Int
//    var person:Person
    var itemName:String = ""
//    var date:Date
    var itemCost:Int
    var kind:Categlorie
}


class PersonRecordModel:ObservableObject {
    
    @Published var spendings:[Spending] = []
    
//    var loadedSpendings = UserDefaults.standard.array(forKey: "Spendings-Array")
    var lastID:Int = -1
    
    private func newId()->Int{
        lastID += 1
        return lastID
    }
    
    func addSpending(itemName:String, cost:Int, kind:Categlorie) {
        let newSpending = Spending(id: newId(), itemName: itemName, itemCost: cost, kind:kind)
        spendings.append(newSpending)
//        UserDefaults.standard.setValue(spendings, forKey: "Spendings-Array")
    }
    
    func getFormattedSpending(id:Int) -> String{
        return "\(spendings[id].itemName): \(spendings[id].itemCost) ----- \(spendings[id].kind.name)"
    }
    

    func getFormattedSpendings() -> [String]{
        var formattedSpendings:[String] = []
        for spending in spendings {
            formattedSpendings.append(getFormattedSpending(id:spending.id))
        }
        return formattedSpendings
    }
    
    init() {
        addSpending(itemName: "午餐", cost: 200, kind: Categlories().categlories[0])
        addSpending(itemName: "咖啡", cost: 120, kind: Categlories().categlories[1])

    }
}

//struct Person {
//    var personID:Int
//    var personName:String
//}
