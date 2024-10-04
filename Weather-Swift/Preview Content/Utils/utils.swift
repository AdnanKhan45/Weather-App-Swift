//
//  utils.swift
//  Weather-Swift
//
//  Created by Muhammad Adnan on 03/10/2024.
//

import Foundation

func iconForWeatherCondition(_ condition: String) -> String {
    switch condition {
    case "Clear":
        return "sun.max.fill"
    case "Partly cloudy", "Clouds":
        return "cloud.fill"
    case "Rain":
        return "cloud.rain.fill"
    case "Snow":
        return "snow"
    case "Thunderstorm":
        return "cloud.bolt.fill"
    default:
        return "cloud.fill"
    }
}
