//
//  ContentView.swift
//  ChooseYouColorWithSwiftUI
//
//  Created by Denis Bokov on 15.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderColor = Double.random(in: 0...255)
    @State private var greenSliderColor = Double.random(in: 0...255)
    @State private var blueSliderColor = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            YourColorView(colorRectangle: Color(red: redSliderColor/255, green: greenSliderColor/255, blue: blueSliderColor/255))
            VStack {
                SliderColorView(foregroundColorText: .red, sliderValue: $redSliderColor)
                    .frame(height: 30)
                SliderColorView(foregroundColorText: .green, sliderValue: $greenSliderColor)
                    .frame(height: 30)
                SliderColorView(foregroundColorText: .blue, sliderValue: $blueSliderColor)
                    .frame(height: 30)
            }
            .padding()
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}
