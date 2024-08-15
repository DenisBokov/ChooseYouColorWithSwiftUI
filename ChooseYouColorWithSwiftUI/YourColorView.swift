//
//  YourColorView.swift
//  ChooseYouColorWithSwiftUI
//
//  Created by Denis Bokov on 15.08.2024.
//

import SwiftUI

struct YourColorView: View {
    let colorRectangle: Color
    
    var body: some View {
        Rectangle()
            .frame(width: 325, height: 200)
            .foregroundColor(colorRectangle)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 4))
    }
}

#Preview {
    YourColorView(colorRectangle: .blue)
}
