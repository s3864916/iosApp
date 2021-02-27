//
//  ContentView.swift
//  feeRecorder
//
//  Created by 紀詠恩 on 2020/12/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
        Home(personRecordModel: PersonRecordModel())
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}}
