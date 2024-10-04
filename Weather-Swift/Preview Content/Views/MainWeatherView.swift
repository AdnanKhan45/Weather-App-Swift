//
//  MainWeatherView.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation
import SwiftUI

struct MainWeatherTemperatureView: View {
    
    var temperature: Int = 76
    var imageName: String = "cloud.sun.fill"
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding()
    }
}
