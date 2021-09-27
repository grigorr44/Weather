//
//  WeatherNetworkingServiceMock.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

class WeatherNetworkingServiceMock: WeatherNetworkingServiceProtocol {
    
    func getWeatherList(country: String, count: Int, completion: @escaping (_ weatherList: WeatherList?, _ error: Error?) -> Void) {
        let weatherList = WeatherList(cityName: "Paris",
                                      cityCoordinate: (51, 52),
                                      weatherList: [Weather(id: 1,
                                                            date: Date(),
                                                            dayTemp: 12,
                                                            nightTemp: 13,
                                                            status: "status",
                                                            statusDescription: "desc",
                                                            statusIcon: "iconPath",
                                                            pressure: 23,
                                                            humidity: 23,
                                                            speed: 12,
                                                            windDegree: 43,
                                                            sunriseDate: Date(),
                                                            sunsetDate: Date()),
                                                    Weather(id: 2,
                                                            date: Date(),
                                                            dayTemp: 18,
                                                            nightTemp: 20,
                                                            status: "status",
                                                            statusDescription: "desc",
                                                            statusIcon: "iconPath",
                                                            pressure: 23,
                                                            humidity: 23,
                                                            speed: 12,
                                                            windDegree: 43,
                                                            sunriseDate: Date(),
                                                            sunsetDate: Date())])
        completion(weatherList, nil)
    }
}
