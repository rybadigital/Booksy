//
//  MainViewController.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 10/11/2020.
//

import UIKit

final class MainViewController: BindableViewController<MainViewModel> {
        
    let searchBar: UISearchBar = UISearchBar()
    let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpLayout()
    }
    
    override func viewModelDidUpdate(_ updatedProperty: AnyKeyPath?) {
        super.viewModelDidUpdate(updatedProperty)
      
        if updatedProperty == \MainViewModel.cityListVM {
            collectionView.reloadData()
        }
    }

    private func setUpView() {
        title = "Znajdź miasto"
        
        searchBar.delegate = self
        searchBar.placeholder = "Wpisz miasto"
                        
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MainViewCollectionViewCell.self, forCellWithReuseIdentifier: MainViewCollectionViewCell.identifier)
        
    }
    
    private func setUpLayout() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.cityListVM.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCollectionViewCell.identifier,
                                                            for: indexPath) as? MainViewCollectionViewCell else {
            fatalError("\(self)")
        }
        
        cell.bind(source: viewModel.cityListVM[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {        
        let vc = WeatherCityViewController()
        vc.viewModel.currentWeather = viewModel.cityListVM[indexPath.row].currentWeather
        
        navigationController?.pushViewController(vc, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: view.frame.width, height: 80)
    }
}

extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            invokeEvent(MainViewModel.Events.searchCity(city: text))
            view.endEditing(true)
        }
    }
}
