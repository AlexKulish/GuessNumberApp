//
//  ContentView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
            
            
            Button {
                print("Проверь меня!")
            } label: {
                Text("Проверь меня!")
            }
            .padding()
            
            Button {
                targetValue = Int.random(in: 1...100)
            } label: {
                Text("Начать заново")
            }


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
