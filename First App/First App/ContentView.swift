//
//  ContentView.swift
//  First App
//
//  Created by 紀詠恩 on 2020/11/14.
//

import SwiftUI


struct ContentView: View {
    let tipPercents = [0, 10, 15, 20, 25]
    
    @State var tipPercent = 1
    @State var input: String = ""
    @State var people: Int = 1
    var tipAmount: Double{
        let totalCheck = Double(tipPercents[tipPercent]) / 100 * (Double(input) ?? 0) + (Double(input) ?? 0)
        let splitedCheck = totalCheck / Double(people)
        return splitedCheck
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("金額：", text: $input)
                        .keyboardType(.decimalPad)
                }
                
                Section{
                    Picker(selection: $people, label: Text("Picker"), content: {
                        ForEach(0..<100){ people in
                            Text("\(people) 人")
                        }
                    })
                }
                
                Section(header: Text("小費")){
                    Picker("", selection: $tipPercent, content: {
                        ForEach(0 ..< tipPercents.count){
                            Text("\(self.tipPercents[$0])%")
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("計算結果")){
                    Text("$ \(tipAmount, specifier: "%.2f")")
                }
                
                }.navigationTitle("WeSplit")
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
