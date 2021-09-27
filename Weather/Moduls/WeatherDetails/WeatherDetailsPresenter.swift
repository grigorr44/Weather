//
//  WeatherDetailsPresenter.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import Foundation


final class WeatherDetailsPresenter {
    // MARK:- Private properties
    
    private var weather: Weather
    private weak var view: WeatherDetailsViewProtocol?
    
    // MARK:- Initialiser
    
    init(view: WeatherDetailsViewProtocol,
         weather: Weather) {
        self.view = view
        self.weather = weather
    }
    
    // MARK:- Public methods
    
    func load() {
        setupView()
    }
    
    // MARK:- Private methods
    
    private func setupView() {
        view?.setStatus(weather.status ?? "")
        view?.setPressure(String(weather.pressure ?? 0))
        view?.setHumidity(String(weather.humidity ?? 0))
        view?.setDate(dateMonthDayFormater(date: weather.date))
        view?.setVisibility(String(weather.speed ?? 0))
        view?.setTemperature(String(weather.dayTemp))
        view?.setDayTemp(String(weather.dayTemp))
        view?.setNightTemp(String(weather.nightTemp))
        view?.setSunsetDate(dateHourMinFormater(date: weather.sunsetDate))
        view?.setSunriseDate(dateHourMinFormater(date: weather.sunriseDate))
        view?.rotateWindArrow(degreeToRadian(weather.windDegree ?? 0))
        view?.setStatusDescription(weather.statusDescription ?? "")
    }
    
    private func degreeToRadian(_ degrees: Float) -> Float {
        return degrees * (.pi / 180)
    }
    
    private func dateHourMinFormater(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func dateMonthDayFormater(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
