//
//  HistoryView.swift
//  feeRecorder
//
//  Created by 紀詠恩 on 2020/12/18.
//

import SwiftUI

struct HistoryRowView: View {
    var spend:Spending
    var body: some View {
        HStack{
            Text("\(spend.itemName) : \(spend.itemCost)  ----  \(spend.kind.name)")
        }
    }
}


struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRowView(spend: PersonRecordModel().spendings[0])
    }
}
