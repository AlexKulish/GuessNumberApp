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
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        slider.value = Float(currentValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = .red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - currentValue)
        return 100 - difference
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
        SliderView(currentValue: .constant(50), targetValue: 50)
    }
}
