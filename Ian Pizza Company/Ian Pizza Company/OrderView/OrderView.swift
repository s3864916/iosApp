//
//  OrderView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/9.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orderModel:OrderModel
    var body: some View {
        VStack{
            ListHeaderView(headLineText: "購物車")
            OrderListView(orderModel: orderModel)
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(orderModel: OrderModel())
    }
}
