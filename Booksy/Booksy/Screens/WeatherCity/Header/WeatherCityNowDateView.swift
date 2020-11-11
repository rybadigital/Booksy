//
//  WeatherCityNowDateView.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import UIKit

final class WeatherCityNowDateView: BindableView<WeatherCityNowDateViewModel> {
        
    let cityLabel: UILabel = UILabel()
    let temperatureLabel: UILabel = UILabel()
    let feelsLikeTemperatureLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    let humidityLabel: UILabel = UILabel()
    let pressureLabel: UILabel = UILabel()
    
    override func bind(source: WeatherCityNowDateViewModel) {
        super.bind(source: source)
        
        setUpLayout()
        
        backgroundColor = .white
        cityLabel.text = source.city + ", " + source.countryCode
        temperatureLabel.text = "\(source.temperature)°C"
        feelsLikeTemperatureLabel.text = "Feels like \(source.feelsLikeTemperature)°C"
        descriptionLabel.text = source.description
        humidityLabel.text = "Humidity: \(source.humidity) %"
        pressureLabel.text = "\(source.pressure) hPa"
    }
    
    private func setUpLayout() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        feelsLikeTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cityLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(feelsLikeTemperatureLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(humidityLabel)
        self.addSubview(pressureLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 8),
            temperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            feelsLikeTemperatureLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor),
            feelsLikeTemperatureLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: feelsLikeTemperatureLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            pressureLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            pressureLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            
            humidityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor),
            humidityLabel.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor)
        ])
    }
}
