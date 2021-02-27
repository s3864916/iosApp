//
//  ContentView.swift
//  FeeSpliter
//
//  Created by 紀詠恩 on 2020/12/16.
//

import SwiftUI

struct ContentView: View {
    @State var inputMoneyInt:Int = 0
    @State var month:Int = 11
    @State var date:Int = 11
    @State var moneyProportion:Double = 0.5
    @State var caculatorMode:
    
    var body: some View {
        VStack{
            HStack{
                Text("$ \(inputMoneyInt)")
                    .font(.title2)
                    .frame(width: 240, height: 60, alignment: .center)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                
                Text("\(month)/\(date)")
                    .font(.title2)
                    .frame(width: 60, height: 60, alignment: .center)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
            }
            .padding()
            HStack{
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 7)}, label: {
                    buttonView(buttonText: "7")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 8)}, label: {
                    buttonView(buttonText: "8")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 9)}, label: {
                    buttonView(buttonText: "9")
                })
                Button(action: {}, label: {
                    buttonView(buttonText: "/")
                })
            }
            .padding(.horizontal, 25.0)

            HStack{
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 4)}, label: {
                    buttonView(buttonText: "4")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 5)}, label: {
                    buttonView(buttonText: "5")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 6)}, label: {
                    buttonView(buttonText: "6")
                })
                buttonView(buttonText: "X", textSize: .title2)
            }
            .padding(.horizontal, 25.0)

            HStack{
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 1)}, label: {
                    buttonView(buttonText: "1")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 2)}, label: {
                    buttonView(buttonText: "2")
                })
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 3)}, label: {
                    buttonView(buttonText: "3")
                })
                buttonView(buttonText: "-")
            }
            .padding(.horizontal, 25.0)
            
            HStack{
                Button(action: {inputMoneyInt = insertNum(originNumber: inputMoneyInt, numberToInsert: 0)}, label: {
                    buttonView(buttonText: "0")
                })
                Button(action: {inputMoneyInt = 0}, label: {
                    buttonView(buttonText: "Clear", textSize: .title3)
                })
                buttonView(buttonText: "=")
                buttonView(buttonText: "+")
            }
            .padding(.horizontal, 25.0)

            moneyDividerView(firstPerson: "Ian", secondPerson: "Nelly", totalFee: $inputMoneyInt, moneyProportion: $moneyProportion)
                .padding(.horizontal)
            
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func insertNum(originNumber:Int, numberToInsert:Int) -> Int{
    guard originNumber != 0 else {
        return numberToInsert
    }
    let numberString = String(originNumber)
    var numberArray:[String] = numberString.components(separatedBy: "")
    numberArray.append(String(numberToInsert))
    var outCome = ""
    for index in numberArray {
        outCome += index
    }
    return Int(outCome)!
}
