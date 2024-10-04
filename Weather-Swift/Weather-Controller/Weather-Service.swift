import Foundation


class WeatherViewModel: ObservableObject {
    @Published var weatherData: [DailyWeather] = []

    let apiKey = "5e86e2a3c4564d4bb4561603240310"

    @MainActor
    func fetchWeather(lat: Double, lon: Double) async {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(apiKey)&q=\(lat),\(lon)&days=10"
        
        // Logging the request URL to the console
        print("Fetching weather data from: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Checking the HTTP status code
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
            }
            
            // Log the raw data response
            if let rawString = String(data: data, encoding: .utf8) {
                print("Raw API response: \(rawString)")
            }
            
            // Attempt to decode the JSON response
            let decodedResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            DispatchQueue.main.async {
                self.weatherData = decodedResponse.forecast.forecastday
                print("Weather data fetched successfully. Number of days: \(self.weatherData.count)")
            }
        } catch {
            print("Failed to fetch weather data: \(error.localizedDescription)")
        }
    }
}
