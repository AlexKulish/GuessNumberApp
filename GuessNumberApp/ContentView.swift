//
//  ContentView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 20
    
    @State private var isCheck = false
    
    private let minimumValue = 0
    private let maximumValue = 100
    
    var body: some View {
        VStack {
            
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("\(minimumValue)")
                SliderView(currentValue: $currentValue,
                           targetValue: targetValue,
                           colorThumb: .red,
                           minimumValue: minimumValue,
                           maximumValue: maximumValue)
                Text("\(maximumValue)")
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
        ContentView()
    }
}
