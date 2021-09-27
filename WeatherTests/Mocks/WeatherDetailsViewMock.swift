//
//  WeatherDetailsViewMock.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

class WeatherDetailsViewMock: WeatherDetailsViewProtocol {
    
    var temperature: String?
    var status: String?
    var date: String?
    var nightTemp: String?
    var dayTemp: String?
    var rotateWindArrow: Float?
    var pressure: String?
    var humidity: String?
    var visibility: String?
    var sunriseDate: String?
    var sunsetDate: String?
    var dayStatus: String?
    var nightStatus: String?
        
    func setTemperature(_ temp: String) {
        temperature = temp
    }
    
    func setStatus(_ text: String) {
        status = text
    }
    
    func setDate(_ text: String) {
        date = text
    }
    
    func setNightTemp(_ temp: String) {
        nightTemp = temp
    }
    
    func setDayTemp(_ temp: String) {
        dayTemp = temp
    }
    
    func rotateWindArrow(_ radians: Float) {
        rotateWindArrow = radians
    }
    
    func setPressure(_ text: String) {
        pressure = text
    }
    
    func setHumidity(_ text: String) {
        humidity = text
    }
    
    func setVisibility(_ text: String) {
        visibility = text
    }
    
    func setSunriseDate(_ text: String) {
        sunriseDate = text
    }
    
    func setSunsetDate(_ text: String) {
        sunsetDate = text
    }
    
    func setDayStatus(_ text: String) {
        dayStatus = text
    }
    
    func setNightStatus(_ text: String) {
        nightStatus = text
    }
}
