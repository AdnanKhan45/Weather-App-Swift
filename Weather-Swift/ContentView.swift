//
//  ContentView.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 01/10/2024.
//  Doing Swift for the first time
//  To be honest, I love it.
//  Declarative is "narrative" -- Kinda, my own quote while falling in love with declarative UI. Doing Flutter from 2020 and now learning to iOS App Development.
//  Learning Swift to fly Swiftly

import SwiftUI

struct ContentView: View {
    
    @Binding var isNight: Bool
    var cityName: String
    var latitude: Double
    var longitude: Double
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityView(title: cityName)
                
                if let currentWeather = viewModel.weatherData.first {
                    MainWeatherTemperatureView(temperature: Int(currentWeather.day.avgtemp_c),
                                              imageName: iconForWeatherCondition(currentWeather.day.condition.text))
                } else {
                    Text("Loading current weather...")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)
                }
                                
                if viewModel.weatherData.isEmpty {
                    // Placeholder while loading
                    Text("Loading 10-day forecast...")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.white)
                } else {
                    WeatherDaysView(weatherData: viewModel.weatherData)
                }
                
                Button(action: {
                    isNight.toggle()
                }) {
                    WeatherButtonStyle(title: "Change to \(isNight ? "Day" : "Night")", backgroundColor: .white, foregroundColor: .blue)
                }
                Spacer()
              
            }
            .onAppear {
                Task {
                    await viewModel.fetchWeather(lat: latitude, lon: longitude)
                }
            }
        }
    }
}


#Preview {
    CitiesTabView()
}

struct CitiesTabView: View {
    
    @State var isNight: Bool = false
    
    var body: some View {
        TabView {
            ContentView(isNight: $isNight, cityName: "Cupertino, CA", latitude: 34.0522, longitude: -118.2437)
                .tabItem {
                    Label("Cupertino", systemImage: "cloud.sun.fill")
                }
            
            ContentView(isNight: $isNight, cityName: "New York, NY", latitude: 40.7128, longitude: -74.0060)
                .tabItem {
                    Label("New York", systemImage: "sun.max.fill")
                }
            
            ContentView(isNight: $isNight, cityName: "London, UK", latitude: 51.5074, longitude: -0.1278)
                .tabItem {
                    Label("London", systemImage: "cloud.fill")
                }
        }
        .colorScheme(isNight ? .dark : .light)
        .tint(.white)
        .toolbarColorScheme(isNight ? .dark : .light)
    }
}

