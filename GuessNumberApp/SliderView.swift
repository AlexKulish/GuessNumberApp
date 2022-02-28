//
//  SliderView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    
    @Binding var currentValue: Int
    
    var targetValue: Int
    var colorThumb: Color
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.value = Float(currentValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
        let uiColor = UIColor(colorThumb)
        let ciColor = CIColor(color: uiColor)
        let alpha = CGFloat(computeScore())
        
        
        uiView.value = Float(currentValue)
        
        uiView.thumbTintColor = UIColor(
            displayP3Red: ciColor.red,
            green: ciColor.green,
            blue: ciColor.blue,
            alpha: alpha
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
    private func computeScore() -> Float {
        let difference = abs(targetValue - currentValue)
        let alpha: Float = (Float(targetValue) - Float(difference)) / Float(targetValue)
        return alpha
    }
    
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Int
        
        init(value: Binding<Int>) {
            self._currentValue = value
        }
        
        @objc func changeValue(_ sender: UISlider) {
            currentValue = Int(sender.value)
        }
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), targetValue: 50, colorThumb: .red)
    }
}
