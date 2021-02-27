//
//  NewDataView.swift
//  ToDosListTest
//
//  Created by 紀詠恩 on 2021/1/5.
//

import SwiftUI

struct NewDataView: View {
    
    @ObservedObject var homeData: HomeViewModel
    @Environment(\.managedObjectContext) var content
    
    var body: some View {
        VStack{
            HStack{
                Text("\(homeData.updatedData == nil ? "Add" : "Update")")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            TextEditor(text: $homeData.title)
                .padding()
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                Text("When")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Spacer(minLength: 0)
            }
            .padding()
            Spacer(minLength: 0)
            
            HStack{
                DateButtonView(title: "Today", homeData: homeData)
                DateButtonView(title: "Tomorrow", homeData: homeData)
                DatePicker("", selection: $homeData.date, displayedComponents: .date)
                    .labelsHidden()
            }
            Button(action: {homeData.writeData(content: content)}, label: {
                Label(
                    title: { Text("\(homeData.updatedData == nil ?  "Add" : "Update") Task")
                        .font(.title2).fontWeight(.bold).foregroundColor(.white) },
                    icon: { Image(systemName: "plus").font(.title2).foregroundColor(.white) }
                )
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(
                LinearGradient(gradient: Gradient(colors: [Color("Color1"), Color("Color2")]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(8)
            })
            .padding()
            .disabled(homeData.title == "" ? true : false)
            .opacity(homeData.title == "" ? 0.5 : 1.0)
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))

    }
}

struct NewDataView_Previews: PreviewProvider {
    static var previews: some View {
        NewDataView(homeData: HomeViewModel())
    }
}
