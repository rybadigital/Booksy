//
//  WeatherCityViewController.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 11/11/2020.
//

import UIKit

final class WeatherCityViewController: BindableViewController<WeatherCityViewModel> {
            
    let headerView: WeatherCityNowDateView = WeatherCityNowDateView()
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpLayout()
    }
    
    override func viewModelDidUpdate(_ updatedProperty: AnyKeyPath?) {
        super.viewModelDidUpdate(updatedProperty)
      
        if updatedProperty == \WeatherCityViewModel.cityForecastVM {
            collectionView.reloadData()
        }
        
        if updatedProperty == \WeatherCityViewModel.weatherCityHeaderViewModel {
            if let weatherCityHeaderVM = viewModel.weatherCityHeaderViewModel {
                headerView.bind(source: weatherCityHeaderVM)                
            }
        }
    }

    private func setUpView() {
        title = "Pogoda i prognoza"
        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(WeatherCityCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCityCollectionViewCell.identifier)
        
    }
    
    private func setUpLayout() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                
        view.addSubview(headerView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension WeatherCityViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.cityForecastVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCityCollectionViewCell.identifier,
                                                            for: indexPath) as? WeatherCityCollectionViewCell else {
            fatalError("\(self)")
        }
        
       cell.bind(source: viewModel.cityForecastVM[indexPath.row])
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: view.frame.width, height: 80)
    }
}
