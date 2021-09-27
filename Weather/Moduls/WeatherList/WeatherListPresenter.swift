//
//  WeatherListPresenter.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import Foundation

final class WeatherListPresenter {
    // MARK:- Private properties
    
    private weak var view: WeatherListViewProtocol?
    
    private var weatherNetworkingService: WeatherNetworkingServiceProtocol
    
    private var weatherList: WeatherList?
    
    // MARK:- Initialiser
    
    init(view: WeatherListViewProtocol,
         weatherNetworkingService: WeatherNetworkingServiceProtocol) {
        self.view = view
        self.weatherNetworkingService = weatherNetworkingService
    }
    
    // MARK:- Public methods
    
    func getList() -> [Weather]? {
        return weatherList?.weatherList
    }
    
    func load() {
        weatherNetworkingService.getWeatherList(country: "Paris", count: 16) { [weak self] weatherList, error in
            guard let self = self else { return }
            if let weatherList = weatherList {
                self.weatherList = weatherList
                self.view?.reloadView()
            } else if let error = error {
                AlertFactory.default(message: error.localizedDescription).show()
            }
        }
    }
}

