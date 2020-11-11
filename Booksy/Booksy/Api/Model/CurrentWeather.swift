//
//  CurrentWeather.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 10/11/2020.
//

import Foundation

struct CurrentWeather: Codable {
    
    let id: Int?
    let name: String?
    let sys: Sys?
    let main: Temperature?
    let weather: [Weather]?
    let visibility: String?
    let coord: Coord?
}
