//
//  WeatherInfoDTO.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherInfoDTO: Codable {
    let weather: [WeatherDTO]
    let temperature: TemperatureDTO
    let date: Double
    
    private enum CodingKeys: String, CodingKey {
        case weather = "weather",
             temperature = "temp",
             date = "dt"
    }
}
