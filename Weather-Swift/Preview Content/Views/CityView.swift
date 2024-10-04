//
//  CityView.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation
import SwiftUI

struct CityView: View {
    
    var title: String = "Cupertino, CA!"
    
    var body: some View {
        Text(title)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}
