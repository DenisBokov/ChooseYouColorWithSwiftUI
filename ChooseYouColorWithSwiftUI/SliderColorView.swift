//
//  SliderColorView.swift
//  ChooseYouColorWithSwiftUI
//
//  Created by Denis Bokov on 15.08.2024.
//

import SwiftUI

struct SliderColorView: View {
    let foregroundColorText: Color
    
    @Binding var sliderValue: Double
    @State private var textFieldValue: String = ""
    
    @FocusState private var isTextFieldFocused : Bool
    @FocusState private var isSliderFocused : Bool
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))").foregroundStyle(foregroundColorText)
                .frame(width: 35)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .focused($isSliderFocused)
                .onChange(of: sliderValue) {
                    textFieldValue = "\(lround(sliderValue))"
                }
            
            TextField("", text: $textFieldValue)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .onChange(of: textFieldValue) {
                    sliderValue = Double(textFieldValue) ?? 0
                }
        }
    }
    
    private func formatterString(for string: String) -> Double {
        Double(string) ?? 0
    }
}

#Preview {
    SliderColorView(foregroundColorText: .indigo, sliderValue: .constant(133))
}

