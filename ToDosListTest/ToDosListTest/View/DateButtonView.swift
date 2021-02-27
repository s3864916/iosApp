//
//  DateButtonView.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/5.
//

import SwiftUI

struct DateButtonView: View {
    
    var title :String
    @ObservedObject var homeData: HomeViewModel
    var body: some View {
        Button(action: {homeData.updateDate(value: title)}, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    homeData.checkDate() == title ?
                    LinearGradient(gradient: .init(colors: [Color("Color1"), Color("Color2")]), startPoint: .leading, endPoint: .trailing)
                    :
                        LinearGradient(gradient: .init(colors: [Color.white]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}
