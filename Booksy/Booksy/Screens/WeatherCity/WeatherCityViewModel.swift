//
//  WeatherCityViewModel.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import UIKit

final class WeatherCityViewModel: RootViewModel {
        
    var currentWeather: CurrentWeather?
    
    var weatherCityHeaderViewModel: WeatherCityNowDateViewModel? {
        didSet {
            viewModelDidUpdate(\WeatherCityViewModel.weatherCityHeaderViewModel)
        }
    }
    
    var cityForecastVM: [WeatherCityCollectionViewCellModel] = [] {
        didSet {
            viewModelDidUpdate(\WeatherCityViewModel.cityForecastVM)
        }
    }
    
    override func bindingDidComplete() {
        super.bindingDidComplete()
        
        getForecastWeather()
        
        if let currentWeather = currentWeather {
            weatherCityHeaderViewModel = WeatherCityNowDateViewModel(currentWeather: currentWeather)
        }
    }
    
    private func getForecastWeather() {
        guard let cityID = currentWeather?.id else {
            return
        }
        
        ApiRequest.getForecastWeather(cityID: cityID, completion: { forecast in
            var forecastVM: [WeatherCityCollectionViewCellModel] = []
            
            for forecast in forecast.list ?? [] {
                let vm = WeatherCityCollectionViewCellModel(currentWeather: forecast)
                forecastVM.append(vm)
            }
                                    
            self.cityForecastVM = forecastVM
        }, err: {
            print("error")
        })
    }
}
