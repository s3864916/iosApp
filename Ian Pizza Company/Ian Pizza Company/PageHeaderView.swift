//
//  ContentHeaderView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/6.
//

import SwiftUI

struct PageHeaderView: View {
    var headLineText:String
    var body: some View {
        HStack{
            Spacer()
            Text(headLineText)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding(10)
        .foregroundColor(Color("O1"))
        .background(Color("Y4"))
    }
}

struct ContentHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PageHeaderView(headLineText: "--- 點餐 ---")
    }
}
