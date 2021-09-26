//
//  WeatherInfDTOMapper.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherInfDTOMapper {
    static func map(_ dto: WeatherInfoDTO) -> Weather {
        let weather = dto.weather.first
        return Weather(id: weather?.id ?? "",
                       date: Date(timeIntervalSince1970: dto.date),
                       dayTemp: dto.temperature.day,
                       nightTemp: dto.temperature.night,
                       status: weather?.description,
                       statusIcon: weather?.icon)
    }
}
