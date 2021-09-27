//
//  WeatherMock.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

struct WeatherMock {
    static let averageDayWeather = Weather(id: 1,
                                       date: Date(timeIntervalSince1970: 1632758594),
                                       dayTemp: 15,
                                       nightTemp: 12,
                                       status: "Rainy",
                                       statusDescription: "Rainy day",
                                       statusIcon: "IconPath",
                                       pressure: 13.0,
                                       humidity: 14.5,
                                       speed: 12.8,
                                       windDegree: 23.4,
                                       sunriseDate: Date(timeIntervalSince1970: 1632758456),
                                       sunsetDate: Date(timeIntervalSince1970: 16327585959))
    static let hotDayWeather = Weather(id: 1,
                                       date: Date(timeIntervalSince1970: 1632758594),
                                       dayTemp: 27,
                                       nightTemp: 12,
                                       status: "Rainy",
                                       statusDescription: "Rainy day",
                                       statusIcon: "IconPath",
                                       pressure: 13.0,
                                       humidity: 14.5,
                                       speed: 12.8,
                                       windDegree: 23.4,
                                       sunriseDate: Date(timeIntervalSince1970: 1632758456),
                                       sunsetDate: Date(timeIntervalSince1970: 16327585959))
    static let coldDayWeather = Weather(id: 1,
                                        date: Date(timeIntervalSince1970: 1632758594),
                                        dayTemp: 8,
                                        nightTemp: 12,
                                        status: "Rainy",
                                        statusDescription: "Rainy day",
                                        statusIcon: "IconPath",
                                        pressure: 13.0,
                                        humidity: 14.5,
                                        speed: 12.8,
                                        windDegree: 23.4,
                                        sunriseDate: Date(timeIntervalSince1970: 1632758456),
                                        sunsetDate: Date(timeIntervalSince1970: 16327585959))
    static let hotNightWeather = Weather(id: 1,
                                         date: Date(timeIntervalSince1970: 1632758594),
                                         dayTemp: 14,
                                         nightTemp: 29,
                                         status: "Rainy",
                                         statusDescription: "Rainy day",
                                         statusIcon: "IconPath",
                                         pressure: 13.0,
                                         humidity: 14.5,
                                         speed: 12.8,
                                         windDegree: 23.4,
                                         sunriseDate: Date(timeIntervalSince1970: 1632758456),
                                         sunsetDate: Date(timeIntervalSince1970: 16327585959))
    static let coldNightWeather = Weather(id: 1,
                                          date: Date(timeIntervalSince1970: 1632758594),
                                          dayTemp: 14,
                                          nightTemp: -1,
                                          status: "Rainy",
                                          statusDescription: "Rainy day",
                                          statusIcon: "IconPath",
                                          pressure: 13.0,
                                          humidity: 14.5,
                                          speed: 12.8,
                                          windDegree: 23.4,
                                          sunriseDate: Date(timeIntervalSince1970: 1632758456),
                                          sunsetDate: Date(timeIntervalSince1970: 16327585959))
    
}
