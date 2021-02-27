//
//  model.swift
//  test
//
//  Created by 紀詠恩 on 2020/12/22.
//

import Foundation

class SaveModel{
    var texts:[String] = []
    
    func addText(text:String){
        self.texts.append(text)
    }
    
    func showText() -> String{
        var Ans = ""
        for item in self.texts {
            Ans = Ans + ", " + item 
        }
        return Ans
    }
}
