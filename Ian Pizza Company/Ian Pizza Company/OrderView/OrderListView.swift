//
//  OrderListView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/5.
//

import SwiftUI

struct OrderListView: View {
    @ObservedObject var orderModel:OrderModel
    var body: some View {
        VStack{
            List{
                Section(
                ){
                    ForEach(orderModel.orders){item in
                        OrderRowView(orderModel: orderModel, orderItem:item)
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orderModel: OrderModel())
    }
}
