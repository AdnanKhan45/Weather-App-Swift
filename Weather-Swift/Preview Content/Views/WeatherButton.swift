//
//  WeatherButton.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 02/10/2024.
//

import SwiftUI

struct WeatherButtonStyle : View {
    
    var title: String
    var backgroundColor: Color
    var foregroundColor: Color
    
    var body : some View {
        Text(title)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(foregroundColor)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
