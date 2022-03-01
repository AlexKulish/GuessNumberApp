//
//  GameSlider.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 01.03.2022.
//

import SwiftUI

struct GameSlider: View {
    
    @Binding var currentValue: Int
    
    let targetValue: Int
    let alpha: Int
    let color: UIColor
    
    var body: some View {
        VStack {
            
            Text("Подвинь слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                SliderView(currentValue: $currentValue,
                           alpha: alpha,
                           color: color)
                Text("100")
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(50), targetValue: 50, alpha: 100, color: .red)
    }
}
