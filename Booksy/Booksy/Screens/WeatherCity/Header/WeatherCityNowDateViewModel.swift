//
//  WeatherCityNowDateViewModel.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

final class WeatherCityNowDateViewModel: BaseViewModel {

    let city: String
    let countryCode: String
    let temperature: Double
    let feelsLikeTemperature: Double
    let description: String
    let pressure: Double
    let humidity: Double
    
    init(currentWeather: CurrentWeather) {
        self.city = currentWeather.name ?? "-"
        self.countryCode = currentWeather.sys?.country ?? "-"
        self.temperature = currentWeather.main?.temp ?? 0
        self.feelsLikeTemperature = currentWeather.main?.feels_like ?? 0
        self.description = currentWeather.weather?.first?.description ?? "-"
        self.pressure = currentWeather.main?.pressure ?? 0
        self.humidity = currentWeather.main?.humidity ?? 0        
    }
}
