//
//  buttonView.swift
//  FeeSpliter
//
//  Created by 紀詠恩 on 2020/12/16.
//

import SwiftUI

struct buttonView: View {
    
    var buttonText:String
    var textSize:Font = .title
    var body: some View {
        Circle()
            .frame(height: 70, alignment: .center)
            .foregroundColor(Color(.systemGray4))
            .overlay(
                Text(buttonText)
                    .fontWeight(.semibold)
                    .font(textSize))
    }
}

struct buttonView_Previews: PreviewProvider {
    static var previews: some View {
        buttonView(buttonText: "0")
    }
}
