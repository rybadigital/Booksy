//
//  MainViewCollectionViewModel.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

final class MainViewCollectionViewModel: BaseViewModel, IdentifiableObject {
        
    let city: String
    let countryCode: String
    let lon: Double
    let lat: Double
    let temperature: Double
    
    let currentWeather: CurrentWeather
    
    // MARK: - initiation
    init(currentWeather: CurrentWeather) {        
        self.city = currentWeather.name ?? "-"
        self.countryCode = currentWeather.sys?.country ?? "-"
        self.lon = currentWeather.coord?.lon ?? 0
        self.lat = currentWeather.coord?.lat ?? 0
        self.temperature = currentWeather.main?.temp ?? 0
        
        self.currentWeather = currentWeather
    }
}
