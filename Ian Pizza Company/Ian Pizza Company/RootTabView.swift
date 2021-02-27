//
//  RootTabView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/9.
//

import SwiftUI

struct RootTabView: View {
    @ObservedObject var orderModel:OrderModel
    var body: some View {
        TabView{
            ContentView(orderModel: orderModel)
                .tabItem { Image(systemName: "list.dash") }
            OrderListView(orderModel: orderModel)
                .tabItem { Image(systemName: "cart") }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView(orderModel: OrderModel())
    }
}
