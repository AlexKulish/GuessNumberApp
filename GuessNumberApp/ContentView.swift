//
//  ContentView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = 50
    @State private var isCheck = false
    
    var body: some View {
        VStack {
            
            GameSlider(currentValue: $currentValue,
                       targetValue: targetValue,
                       alpha: calculateScore(),
                       color: .red)
            
            Button { isCheck.toggle() } label: { Text("Проверь меня!") }
            .alert("Your score", isPresented: $isCheck, actions: {}) {
                Text("\(calculateScore())")
            }
            .padding()
            
            Button { targetValue = Int.random(in: 1...100) } label: {
                Text("Начать заново")
            }
        }
    }
    
    private func calculateScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - difference
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
