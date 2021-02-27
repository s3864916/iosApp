//
//  ContentView.swift
//  test
//
//  Created by 紀詠恩 on 2020/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var input:String = ""
    @State var inputArray:[String] = []
    @State var loadedData:[String] = []
    
    let textArrayKey = "TextArray"
    var body: some View {
        VStack{
            HStack {
                Text("列表：")
                ForEach(inputArray, id: \.self){item in
                    Text(item)
                }
            }
            .frame(height: 30, alignment: .center)
            .border(Color.black)
            HStack{
                TextField(" input", text: $input)
                    .padding(5.0)
                    .border(Color.black)
                    .padding(5.0)
                Button(action: {
                        inputArray.append(input)
                }, label: {
                    Text("輸入列表")
                })
                .padding(5.0)
                .foregroundColor(.white)
                .background(Color(.gray))
            }
            HStack {
                HStack {
                    ForEach(loadedData, id: \.self){item in
                        Text(item)
                    }
                }                .padding(5.0)
                .border(Color.black)
                .padding(5.0)
                Button(action: {loadedData = loadData(key: textArrayKey)}, label: {
                    Text("Load")
                })
                .padding(5.0)
                .foregroundColor(.white)
                .background(Color(.gray))
            }
            HStack {
                Button(action: {
                    UserDefaults.standard.setValue(inputArray, forKey: textArrayKey)
                }, label: {
                    Text("存擋")
                })
                .padding(5.0)
                .frame(width: 100, height: 70, alignment: .center)
                .foregroundColor(.white)
                .background(Color(.gray))
                .cornerRadius(10)
                
                Button(action: {
                    UserDefaults.standard.removeObject(forKey: textArrayKey)
                }, label: {
                    Text("刪除存擋")
                })
                .padding(5.0)
                .frame(width: 100, height: 70, alignment: .center)
                .foregroundColor(.white)
                .background(Color(.gray))
                .cornerRadius(10)
            }
            }
        }
    }


func loadData(key:String) -> [String]{
    var data:[String] = []
    if UserDefaults.standard.stringArray(forKey: key) != nil{
        data.append(contentsOf: UserDefaults.standard.stringArray(forKey: key)!)
    }
    return data
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
