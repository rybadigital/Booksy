//
//  MainViewModel.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 10/11/2020.
//

import UIKit

final class MainViewModel: RootViewModel {
    
    enum Events: MyEvent {
        
        case searchCity(city: String)
        case chooseCity(row: Int)
    }
    
    var cityListVM: [MainViewCollectionViewModel] = [] {
        didSet {
            viewModelDidUpdate(\MainViewModel.cityListVM)
        }
    }
    
    override func handleEvent(_ event: MyEvent) {
        super.handleEvent(event)
        
        switch event {
        case Events.searchCity(let city):
            searchCity(city: city)
        default:
            break
        }
    }
    
    private func searchCity(city: String) {
        ApiRequest.findCity(city: city, completion: { cityList in
            var citiesVM: [MainViewCollectionViewModel] = []
            
            for city in cityList.list ?? [] {
                let vm = MainViewCollectionViewModel(currentWeather: city)
                citiesVM.append(vm)
            }
                                    
            self.cityListVM = citiesVM
        }, err: {
            print("error")
        })
    }
}
