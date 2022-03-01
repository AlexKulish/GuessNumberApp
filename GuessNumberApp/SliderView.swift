//
//  SliderView.swift
//  GuessNumberApp
//
//  Created by Alex Kulish on 27.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    
    @Binding var currentValue: Int
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()

        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
        uiView.value = Float(currentValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $currentValue)
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
        SliderView(currentValue: .constant(50), alpha: 50, color: .red)
    }
}
