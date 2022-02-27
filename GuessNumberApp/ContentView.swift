//
//  ContentView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State var currentValue: Int
    
    @State private var isCheck = false
    
    var body: some View {
        VStack {
            
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                SliderView(currentValue: $currentValue, targetValue: targetValue)
                Text("100")
            }
            .padding()
            
            Button { isCheck.toggle() } label: { Text("Проверь меня!") }
            .alert("Your score", isPresented: $isCheck, actions: {}) {
                Text("\(currentValue)")
            }
            .padding()
            
            Button { targetValue = Int.random(in: 0...100) } label: {
                Text("Начать заново")
            }


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentValue: 50)
    }
}
