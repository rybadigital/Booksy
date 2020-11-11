//
//  ForecastWeather.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import Foundation

struct ForecastWeather: Codable {
    
    let list: [CurrentWeather]?
}
