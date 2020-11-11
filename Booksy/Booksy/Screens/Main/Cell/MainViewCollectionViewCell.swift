//
//  MainViewCollectionViewCell.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import UIKit

final class MainViewCollectionViewCell: BindableCollectionViewCell<MainViewCollectionViewModel> {
    
    let cityLabel: UILabel = UILabel()
    let coordLabel: UILabel = UILabel()
    let temperatureLabel: UILabel = UILabel()
    
    override func bind(source: MainViewCollectionViewModel) {
        super.bind(source: source)
        
        setUpLayout()        
        
        cityLabel.text = source.city + ", " + source.countryCode
        coordLabel.text = "\(source.lat), \(source.lon)"
        temperatureLabel.text = "\(source.temperature)°C"
    }
    
    private func setUpLayout() {
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        coordLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(cityLabel)
        self.addSubview(coordLabel)
        self.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            coordLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 16),
            coordLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor),
            
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor),
            temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
