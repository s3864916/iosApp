//
//  HeaderView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Image("pizzaLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Ian's Pizza")
                .font(.system(size: 21, weight: .semibold, design: .rounded))
                .foregroundColor(Color("O2"))
                .padding(5)
                .offset(x: -55, y: -15)
                .rotationEffect(.degrees(315), anchor: UnitPoint(x: 0, y: 0))
        }
        .offset(x: 18, y: 9)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
