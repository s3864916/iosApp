//
//  Home.swift
//  FeeRecorder2
//
//  Created by 紀詠恩 on 2021/1/10.
//

import SwiftUI
import CoreData

struct Home: View {
    @State var inputItemName:String = ""
    @State var inputMoney:String = ""
    @ObservedObject var personRecordModel:PersonRecordModel
    @State var categlorie = Categlories().categlories[0]
    
    @Environment(\.managedObjectContext) var content
    @FetchRequest(entity: Spend.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: false)]) var results: FetchedResults<Spend>

    var body: some View {
        VStack{
//            Picker(selection: $categlorie, label: Text("種類")){
//                let kinds:[Categlorie] = Categlories().getCateglorieInArray()
//                ForEach(kinds, id: \.self){ kind in
//                    Text("\(kind.name)")
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
            HStack {
                Text("名稱")
                TextField("名稱", text: $inputItemName)
                    .padding(10)
                    .border(Color.black,width: 1.25)
            }
            HStack {
                Text("金額")
                TextField("花費金額", text: $inputMoney)
                    .keyboardType(.asciiCapableNumberPad)
                    .padding(10)
                    .border(Color.black,width: 1.25)
            }
            if Int(inputMoney) != nil{
                HStack{
                    Button(action: {
                        let newSpend = Spend(context: content)
                        newSpend.name = inputItemName
                        newSpend.cost = Int64(inputMoney)!
                        newSpend.date = Date()
                        try! content.save()

                        
//                        personRecordModel.addSpending(itemName: inputItemName, cost: Int(inputMoney)!, kind: categlorie)
                    }, label: {
                        Text("確認")
                    })
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                }
            }
            List(results){ spend in
                VStack{
                    HStack{
                        Text("\(spend.name ?? "unknown")")
                        Spacer()
                        Text("\(spend.cost)")
                    }
                    HStack{
                        Text(spend.date ?? Date(), style: .date)
                            .fontWeight(.bold)
                        Text(spend.date ?? Date(), style: .time)
                            .fontWeight(.bold)
                    }
                }
            }
//            HistoryListView(personRecordModel: personRecordModel)
        }
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
    }
}

//struct kindPickerView: View {
//    @Binding var chooseCateglorie:Categlorie
//    var body: some View {
//        Picker(selection: $chooseCateglorie, label: Text("種類")){
//            let kinds:[Categlorie] = Categlories().getCateglorieInArray()
//            ForEach(kinds, id: \.self){ kind in
//                Text("\(kind.name)")
//            }
//        }
//        .pickerStyle(SegmentedPickerStyle())
//    }
//}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(personRecordModel: PersonRecordModel())
    }
}
