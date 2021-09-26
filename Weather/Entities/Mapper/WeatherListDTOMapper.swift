//
//  WeatherListDTOMapper.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherListDTOMapper {
    static func map(_ dto: WeatherListDTO) -> WeatherList {
        let list = dto.weatherInfolist.compactMap( { WeatherInfDTOMapper.map($0) } )
        return WeatherList(cityName: dto.city.name,
                    cityCoordinate: (dto.city.coordinates.latitude, dto.city.coordinates.longitude),
                    weatherList: list)
    }
}

