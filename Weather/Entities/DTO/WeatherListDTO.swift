//
//  WeatherListDTO.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherListDTO: Codable {
    let city: CityDTO
    let weatherInfolist: [WeatherInfoDTO]
    
    private enum CodingKeys: String, CodingKey {
        case city,
             weatherInfolist = "list"
    }
}

