//
//  ListHeaderView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

struct ListHeaderView: View {
    
    var headLineText:String
    var isPresenting:Bool! = nil
    var body: some View {
        HStack{
            Image(systemName: isPresenting ?? false ? "chevron.down.square":"minus.square.fill")
                .font(.title3)
                .padding(3)
                .padding(.leading, 6)
            Spacer()
            Text(headLineText)
                .font(.title3)
                .fontWeight(.bold)
                .padding(.trailing,8)
        }
        .padding(1)
        .foregroundColor(Color("O1"))
        .background(Color("Y4"))
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(headLineText: "Menu", isPresenting: true)
    }
}
