//
//  OrderRowView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/5.
//

import SwiftUI

struct OrderRowView: View {
    @ObservedObject var orderModel:OrderModel
    var orderItem:OrderItem
    var body: some View {
        HStack(alignment:.firstTextBaseline){
            Text(orderItem.description)
                .font(.headline)
            Spacer()
            Text(orderItem.formattedExtendedPrice)
                .bold()
        }
    }
}

//struct OrderRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderRowView(orderModel: orderModel, orderItem: testOrderItem)
//    }
//}
