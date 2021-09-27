//
//  WeatherDTO.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherDTO: Codable {
    let id: Int
    let status: String
    let statusDescription: String?
    let icon: String
    
    private enum CodingKeys: String, CodingKey {
        case status = "main",
             statusDescription = "description",
             icon,
             id
    }
}
