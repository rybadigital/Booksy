//
//  ApiRequest.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 09/11/2020.
//

import UIKit

final class ApiRequest {
    
    static let baseURL = "https://api.openweathermap.org/data/2.5/"
    static let apiKey = "&appid=ee5f8c6e819c87f19df157c1c0923ad8"
    
    static func findCity(city: String, completion: @escaping (CityList) -> (), err: @escaping () -> ()) {
        let endpoint = "find?q=\(city)"
        let urlString = baseURL + endpoint + apiKey
        
        print(urlString)
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, res, error in
                guard error == nil else {
                    err()
                    
                    return
                }
                             
                guard let responseData = data,
                    let httpResponse = res as? HTTPURLResponse,
                    200 ..< 300 ~= httpResponse.statusCode else {
                    err()
                    
                    return
                }
                                
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(CityList.self, from: responseData) {
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } else {
                    err()
                }
            }.resume()
        }
    }
}
