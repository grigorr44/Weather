//
//  WeatherDTO.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherDTO: Codable {
    let id: String
    let description: String
    let icon: String
    
//    private enum CodingKeys: String, CodingKey {
//        case description
//    }
}
