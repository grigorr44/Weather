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
        return Weather(id: weather?.id,
                       date: Date(timeIntervalSince1970: dto.date),
                       dayTemp: Int(dto.temperature.day),
                       nightTemp: Int(dto.temperature.night),
                       status: weather?.status,
                       statusDescription: weather?.statusDescription,
                       statusIcon: weather?.icon,
                       pressure: dto.pressure,
                       humidity: dto.humidity,
                       speed: dto.speed,
                       windDegree: dto.windDegree,
                       sunriseDate: Date(timeIntervalSince1970: dto.sunriseDate),
                       sunsetDate: Date(timeIntervalSince1970: dto.sunsetDate))
    }
}
