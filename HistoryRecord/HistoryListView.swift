//
//  HistoryListView.swift
//  feeRecorder
//
//  Created by 紀詠恩 on 2020/12/18.
//

import SwiftUI

struct HistoryListView: View {
    @ObservedObject var personRecordModel:PersonRecordModel
    
    var body: some View {
        VStack {
            List(personRecordModel.spendings){item in
                HistoryRowView(spend: item)
            }
        }
    }
}

struct HistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryListView(personRecordModel: PersonRecordModel())
    }
}
