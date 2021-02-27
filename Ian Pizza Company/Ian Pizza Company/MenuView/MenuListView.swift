//
//  menuListView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

struct MenuListView: View {
    @ObservedObject var orderModel:OrderModel
    var menuList = MenuModel().menu
    var body: some View {
            NavigationView{
                List(menuList){ item in
                    NavigationLink(destination: MenuDetailView(orderModel: orderModel, menuItem: item)
                                    .layoutPriority(3)) { MenuRowView(menuItem: item)
                        .foregroundColor(Color("O2")) }
            }        .navigationBarTitle("點餐")

        }
    }
}

struct menuListView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListView(orderModel: OrderModel())
    }
}
