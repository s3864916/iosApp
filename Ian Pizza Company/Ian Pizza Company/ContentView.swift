//
//  ContentView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var orderModel:OrderModel
    @State var isPresentMenu:Bool = true
//    @State var currentPageTitle:String = "--- 點餐 ---"
    var body: some View {
        VStack{
            HeaderView()
            
//            PageHeaderView(headLineText: currentPageTitle)
            Button(action: {isPresentMenu.toggle()}, label: {
                ListHeaderView(headLineText: "目錄", isPresenting: isPresentMenu)
            })
            MenuListView(orderModel: orderModel)
                .layoutPriority(isPresentMenu ? 1:0.5)
            
            Button(action: {isPresentMenu.toggle()}, label: {
                ListHeaderView(headLineText: "購物車" ,isPresenting: !isPresentMenu)
            })
            OrderListView(orderModel: orderModel)
                .layoutPriority(isPresentMenu ? 0.5:1)
            Spacer()
        }
        .animation(.easeInOut)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(orderModel: OrderModel())
    }
}
