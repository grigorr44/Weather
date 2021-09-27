//
//  WeatherTableViewCellPresenter.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

class WeatherTableViewCellPresenter {
    // MARK:- Private properties
    
    private weak var view: WeatherTableViewCellProtocol?
    private var assetsDownloadingService: AssetsDownloadingServiceProtocol
    private var iconDownloadTask: DataLoadProtocol?
    private var weather: Weather
    
    // MARK:- Initialiser
    
    init(view: WeatherTableViewCellProtocol,
         assetsDownloadingService: AssetsDownloadingServiceProtocol,
         weather: Weather) {
        self.view = view
        self.assetsDownloadingService = assetsDownloadingService
        self.weather = weather
    }
    
    // MARK:- Public methods
    
    func load() {
        setupView()
    }
    
    func prepareForReuse() {
        iconDownloadTask?.cancelRequest()
    }
    
    // MARK:- Private methods
    
    private func setupView() {
        view?.setDate(dateFormater(date: weather.date))
        view?.setDayTmpr(String(weather.dayTemp) + "°")
        view?.setNightTmpr(String(weather.nightTemp) + "°")
        view?.setStatusText(weather.status ?? "")
        iconDownloadTask = loadIcon(path: weather.statusIcon)
    }
    
    private func loadIcon(path: String?) -> DataLoadProtocol? {
        guard let path = path else { return nil }
        
        return assetsDownloadingService.getWeatherIcon(path: path) { [weak self] data, error in
            guard let self = self else { return }
            if let error = error {
                AlertFactory.default(message: error.localizedDescription).show()
            } else if let data = data {
                self.view?.setStatusIcon(data)
            }
        }
    }
    
    private func dateFormater(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
}
