//
//  SelectedImageView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/9.
//

import SwiftUI

struct SelectedImageView: View {
    @State var image:String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(10.0)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 3)
    }
}

struct SelectedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedImageView(image: "0_pizza")
    }
}
