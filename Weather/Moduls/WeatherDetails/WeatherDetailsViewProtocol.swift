//
//  WeatherDetailsViewProtocol.swift
//  Weather
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

protocol WeatherDetailsViewProtocol: AnyObject {
    func setTemperature(_ temp: String)
    func setStatus(_ text: String)
    func setDate(_ text: String)
    func setNightTemp(_ temp: String)
    func setDayTemp(_ temp: String)
    func setStatusDescription(_ text: String)
    func rotateWindArrow(_ radians: Float)
    func setPressure(_ text: String)
    func setHumidity(_ text: String)
    func setVisibility(_ text: String)
    func setSunriseDate(_ text: String)
    func setSunsetDate(_ text: String)
}
