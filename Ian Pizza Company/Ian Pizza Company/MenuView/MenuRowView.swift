//
//  menuRowView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/4.
//

import SwiftUI

struct MenuRowView: View {
    
    var menuItem = testMenuItem
    var body: some View {
        HStack{
            VStack{
                HStack {
                    Text(menuItem.name)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .padding(4)
                    Spacer()
                    Text("$\(menuItem.price)")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.trailing, 10)
                }
                Text("\(menuItem.description)")
                    .padding(5)
            }
            Image("\(menuItem.id)_pizza")
                .resizable()
                .scaledToFit()
                .frame(height: 110)
        }
    }
}

struct menuRowView_Previews: PreviewProvider {
    static var previews: some View {
        MenuRowView(menuItem: MenuModel().menu[1])
    }
}
