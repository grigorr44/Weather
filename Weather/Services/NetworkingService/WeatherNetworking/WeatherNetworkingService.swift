//
//  WeatherNetworkingService.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

private let weatherListPath = "/data/2.5/forecast/daily"

protocol WeatherNetworkingServiceProtocol: AnyObject {
    func getWeatherList(country: String, count: Int, completion: @escaping (_ weatherList: WeatherList?, _ error: Error?) -> Void)
}

final class WeatherNetworkingService: WeatherNetworkingServiceProtocol {
    // MARK:- Private properties
    
    private let networkingService: NetworkingServiceProtocol
    
    // MARK:- Initialiser
    
    init(_ networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
    }
    
    // MARK:- Public methods
    
    func getWeatherList(country: String, count: Int, completion: @escaping (_ weatherList: WeatherList?, _ error: Error?) -> Void) {
        let params: [String: Any] = ["q": country,
                                     "cnt": count,
                                     "mode": "json",
                                     "units": "metric"];
        
        networkingService.request(.GET, path: weatherListPath, parameters: params) { (data, error) in
            guard error == nil else { completion(nil, error); return}
            guard let data = data else { completion(nil, nil); return }
            do {
                let decoder = JSONDecoder()
                let weatherListDTO = try decoder.decode(WeatherListDTO.self, from: data)
                let weatherList = WeatherListDTOMapper.map(weatherListDTO)
                completion(weatherList, error)
            } catch let error {
                completion(nil, error)
            }
        }
    }
}
