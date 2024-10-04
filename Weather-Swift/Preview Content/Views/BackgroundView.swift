//
//  BackgroundView.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation
import SwiftUI

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient:Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}
