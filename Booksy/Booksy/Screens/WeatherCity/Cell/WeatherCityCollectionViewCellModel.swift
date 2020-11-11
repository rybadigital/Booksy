//
//  WeatherCityCollectionViewCellModel.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

final class WeatherCityCollectionViewCellModel: BaseViewModel, IdentifiableObject {
    
    let date: String
    let description: String
    let temperature: Double
    
    // MARK: - initiation
    init(currentWeather: CurrentWeather) {
        self.date = currentWeather.dt_txt ?? "-"
        self.description = currentWeather.weather?.first?.description ?? "-"
        self.temperature = currentWeather.main?.temp ?? 0
    }
}
