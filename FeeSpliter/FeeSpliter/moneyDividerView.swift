//
//  moneyDividerView.swift
//  FeeSpliter
//
//  Created by 紀詠恩 on 2020/12/16.
//

import SwiftUI

struct moneyDividerView: View {
    var firstPerson:String
    var secondPerson:String
    @Binding var totalFee:Int
    @Binding var moneyProportion:Double
    var body: some View {
        VStack {
            Slider(value: $moneyProportion, in: 0...1, step: 1/4)
            HStack{
                Text("\(firstPerson) $\(Double(totalFee) * moneyProportion,specifier: "%.f")")
                    .frame(width: 120, height: 20, alignment: .leading)
//                    .padding([.leading, .trailing], 5.0)
                Spacer()
                Text("\(moneyProportion,specifier: "%.2f")")
                    .font(.subheadline)
                Spacer()
                Text("\(secondPerson) $\(Double(totalFee) * (1 - moneyProportion),specifier: "%.f")")
//                    .padding([.leading, .trailing], 5.0)
                    .frame(width: 120, height: 20, alignment: .trailing)
                
            }
        }
    }
}

struct moneyDividerView_Previews: PreviewProvider {
    static var previews: some View {
        moneyDividerView(firstPerson: "恩恩", secondPerson: "寶寶",totalFee: .constant(10) , moneyProportion: .constant(0.5))
    }
}
