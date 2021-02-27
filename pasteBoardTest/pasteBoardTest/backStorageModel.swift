//
//  backStorageModel.swift
//  pasteBoardTest
//
//  Created by 紀詠恩 on 2020/12/22.
//

import Foundation

//struct Text {
//    var text:String
//}

class SaveTexts:ObservableObject{
    @Published var arrayText:[String] = []
    let forKeyValue = "Save_Text"
    
    func saveData(){
        UserDefaults.standard.setValue(self.arrayText, forKey: forKeyValue)
    }
    
    func loadData(){
        self.arrayText.removeAll()
        if let loadData = UserDefaults.standard.stringArray(forKey: forKeyValue){
            self.arrayText.append(contentsOf: loadData)
        }
    }
    
    func addText(text:String) {
        arrayText.append(text)
    }
    
    func getTexts() -> String{
        var text = ""
        for i in arrayText {
            text += i
        }
        return text
    }
    
    init() {
        addText(text: "one")
        addText(text: "two")
    }
    
}
