//
//  ContentView.swift
//  playGround
//
//  Created by 紀詠恩 on 2021/1/11.
//

import SwiftUI

struct ContentView: View {

    @State private var wakeUp = defaultWaketime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var shoingMessage: String {
        let model = SleepCaculator()
        let component = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
        let hour = (component.hour ?? 0) * 60 * 60
        let minute = (component.minute ?? 0) * 60
        var alertMessage = ""
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            alertMessage = formatter.string(from: sleepTime)
        } catch {
            alertMessage = "Error"
        }
        return alertMessage
    }
    
    static var defaultWaketime: Date{
        var compontent = DateComponents()
        compontent.hour = 7
        compontent.minute = 0
        return Calendar.current.date(from: compontent) ?? Date()
        
    }
    var body: some View {
        NavigationView{
            Form{
                Text("sleep at: \(shoingMessage)")
                VStack(alignment: .leading, spacing: 0){
                    Text("預計起床時間：").font(.headline)
                    Spacer()
                    DatePicker("時間", selection: $wakeUp, displayedComponents: .hourAndMinute).labelsHidden()
                        .datePickerStyle(WheelDatePickerStyle())
                 }
                VStack(alignment: .leading, spacing: 0){
                    Text("想睡多久：").font(.headline)
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25){
                        Text("\(sleepAmount, specifier: "%g") 小時")
                    }
                }
                VStack(alignment: .leading, spacing: 0){
                    Picker("coffee intake", selection: $coffeeAmount){
                        ForEach(0 ..< 20){
                            Text("\($0)cup")
                        }
                    }
                }
            }
            .navigationTitle("Better Rest")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
