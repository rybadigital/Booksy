//
//  WeatherCityCollectionViewCell.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import UIKit

final class WeatherCityCollectionViewCell: BindableCollectionViewCell<WeatherCityCollectionViewCellModel> {
    
    let dateLabel: UILabel = UILabel()
    let temperatureLabel: UILabel = UILabel()
    let descriptionLabel: UILabel = UILabel()
    
    override func bind(source: WeatherCityCollectionViewCellModel) {
        super.bind(source: source)
        
        setUpLayout()
        
        dateLabel.text = source.date
        temperatureLabel.text = "\(source.temperature)°C"
        descriptionLabel.text = source.description
    }
    
    private func setUpLayout() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dateLabel)
        self.addSubview(temperatureLabel)
        self.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
