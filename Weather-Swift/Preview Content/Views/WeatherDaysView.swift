//
//  WeatherDaysView.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation
import SwiftUI

struct WeatherDaysView: View {
    let weatherData: [DailyWeather]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(weatherData) { weather in
                    dailyWeatherItem(weather: weather)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
        }
    }
    
    func dailyWeatherItem(weather: DailyWeather) -> some View {
        VStack {
    
            if let date = DateFormatter.weatherAPIDateFormatter.date(from: weather.date) {
                Text(date.formatted(.dateTime.weekday(.abbreviated)).uppercased()) // Using .abbreviated for short day names
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
            } else {
                Text("Unknown Day")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
            }
            
            AsyncImage(url: URL(string: "https:\(weather.day.condition.icon)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .padding(.bottom, 5)
            } placeholder: {
                ProgressView()
            }
            
            Text("\(Int(weather.day.avgtemp_c))°")
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(.white)
                .padding(.bottom, 10)
        }
    }
}
