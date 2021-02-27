//
//  ContentView.swift
//  WordScramble
//
//  Created by 紀詠恩 on 2021/1/21.
//

import Introspect
import SwiftUI

struct ContentView: View {
    @State var useWords = [String]()
    @State var rootWord = "ooo"
    @State var newWord = ""
//    var keyboard : UIKeyboardType = UIKeyboardType.
    var body: some View {
        NavigationView{
            VStack{
                TextField("Enter your word", text: $newWord, onCommit: addWord)
                    .introspectTextField { textfield in
                      textfield.returnKeyType = .done
                    }

                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    
                List(useWords, id: \.self){
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                .listStyle(InsetListStyle())
            }
            .navigationBarTitle(rootWord)
            .onAppear(perform: {
                startGame()
            })
        }
    }
    
    func addWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else {
            return
        }
        print("added")
        useWords.insert(newWord, at: 0)
        newWord = ""
    }
    
    func startGame(){
        if let startWordURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWord = try? String(contentsOf: startWordURL){
                let allWords = startWord.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("could not load words from bundle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
