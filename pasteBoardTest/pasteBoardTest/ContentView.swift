//
//  ContentView.swift
//  pasteBoardTest
//
//  Created by 紀詠恩 on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var saveTexts:SaveTexts
    @State var input:String = ""
    var body: some View {
        VStack{
            TextEditor(text: $input)
                .padding()
                .background(Color(.darkGray))
            LoadDataView(saveTexts: saveTexts)
            HStack{
                Button(action: {
                    saveTexts.addText(text: input)
                }, label: {
                    Text("addText")
                })
                Spacer()
                Button(action: {
                    saveTexts.saveData()
                }, label: {
                    Text("saveData")
                })
            }
            .padding()
            HStack{
                Button(action: {saveTexts.loadData()}, label: {
                    Text("loadData")
                })
            }
            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(saveTexts: SaveTexts())
    }
}


struct LoadDataView: View {
    @ObservedObject var saveTexts:SaveTexts
    var body: some View {
        VStack{
            Text("\(self.$saveTexts.arrayText[1])")
        }
    }
}
