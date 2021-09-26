//
//  CityDTO.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct CityDTO: Codable {
    let name: String
    let coordinates: CoordinateDTO
    
    private enum CodingKeys: String, CodingKey {
        case name,
             coordinates = "coord"
    }
}
