import Foundation

struct WeatherResponse: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [DailyWeather]
}

struct DailyWeather: Codable, Identifiable {
    var id: String { date } // Use the date as a unique identifier
    let date: String
    let day: DayWeather
}

struct DayWeather: Codable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let avgtemp_c: Double
    let condition: WeatherCondition
}

struct WeatherCondition: Codable {
    let text: String
    let icon: String
}
