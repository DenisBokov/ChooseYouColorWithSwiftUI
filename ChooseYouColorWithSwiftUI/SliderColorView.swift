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
    
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            Text("\(lround(sliderValue))").foregroundStyle(foregroundColorText)
                .frame(width: 35)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(foregroundColorText)
                .onChange(of: sliderValue) {
                    textFieldValue = "\(lround(sliderValue))"
                }
            
            TextField("", text: $textFieldValue) {
                withAnimation {
                    checkValue()
                }
            }
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.decimalPad)
                .alert("Не верный формат", isPresented: $showAlert, actions: {}) {
                    Text("Введите число от 0 до 255")
                }
        }
        .onAppear {
            textFieldValue = sliderValue.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Int(textFieldValue), (0...255).contains(value) {
            sliderValue = Double(value)
            return
        }
        showAlert.toggle()
        sliderValue = 0
        textFieldValue = "0"
    }
}

#Preview {
    SliderColorView(foregroundColorText: .indigo, sliderValue: .constant(133))
}

