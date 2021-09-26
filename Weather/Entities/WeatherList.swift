//
//  WeatherList.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct WeatherList {
    let cityName: String
    let cityCoordinate: (latitude: Double, longitude: Double)
    let weatherList: [Weather]
}
