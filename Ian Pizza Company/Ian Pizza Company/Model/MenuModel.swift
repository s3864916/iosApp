//
//  MenuModel.swift
//  Pizza
//
//  Created by Steven Lipton on 9/1/19.
//  Copyright © 2019 Steven Lipton. All rights reserved.
//

import Foundation
///A basic description of a menu item
///`name` the name of the food item
///`description` the decription of the food item
///`price` the base price for the menu item
///`rating` the rating for the menu item
struct MenuItem:Identifiable{
    var id:Int
    var name:String
    var description:String
    var price:Int
}

let testMenuItem =  MenuItem(id:1, name: "夏威夷比薩", description: "當甜中帶點微酸的鳳梨，遇上風味濃郁的火腿，絕妙味道，越吃越順口。", price: 79)


struct MenuModel{
    var menu:[MenuItem] = [
        MenuItem(id:0, name: "超級總匯", description: "經典義式美味，豐富餡料讓人忍不住大快朵頤！", price: 105),
        MenuItem(id:1, name: "夏威夷比薩", description: "當甜中帶點微酸的鳳梨，遇上風味濃郁的火腿，絕妙味道，越吃越順口。", price: 79),
        MenuItem(id:2, name: "和風章魚燒", description: "鮮甜章魚+魷魚，搭配豐富佐料，再淋上照燒醬及美乃滋，齒頰濃郁，回味無窮，喜愛日式風味的朋友絕不能錯過！", price: 105),
        MenuItem(id:3, name: "海鮮比薩", description: "上選美味鮮蝦、蟹味絲及飽滿豐富的魷魚，鮮美滋味，讚不絕口。", price: 105),
        MenuItem(id:4, name: "韓式泡菜燒肉比薩", description: "道地韓式泡菜，配上軟嫩豬肉，微微酸辣口感讓你大呼過癮！", price: 105),
        MenuItem(id:5, name: "燻雞絲蘑菇比薩", description: "特選煙燻雞絲，再加入玉米、蘑菇、洋蔥，烘焙出正點異國風味美食。", price: 95),
        MenuItem(id:6, name: "雙層美式臘腸", description: "加量的雙層美式臘腸，豐盛臘腸口口吃得到，讓你盡享道地的美式風味。", price: 79),
        MenuItem(id:7, name: "鐵板牛柳", description: "鮮嫩牛肉(紐西蘭牛肉)，還有青椒、洋蔥、蘑菇、再加進特調黑胡椒醬，道地中式美味。", price: 205),
        MenuItem(id:8, name: "彩蔬鮮菇比薩", description: "鮮美的蘑菇、還有青花菜、番茄、BBQ素醬，讓你吃到多種蔬菜的清爽美味。(奶素可食)", price: 95),
        MenuItem(id:9, name: "黃金和風雞", description: "外皮金黃內層鮮嫩的雞肉，搭配爽口鮮脆的黃瓜與香甜的鳳梨，忍不住一口接一口的好滋味！", price: 105)
    ]    
}
