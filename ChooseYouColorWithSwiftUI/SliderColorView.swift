//
//  SliderColorView.swift
//  ChooseYouColorWithSwiftUI
//
//  Created by Denis Bokov on 15.08.2024.
//

import SwiftUI

struct SliderColorView: View {
    let foregroundColorText: Color
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Text("\(lround(value))").foregroundStyle(foregroundColorText)
            Slider(value: $value, in: 0...255, step: 1)
        }
        .padding()
    }
}

#Preview {
    SliderColorView(foregroundColorText: .indigo, value: .constant(133))
}
