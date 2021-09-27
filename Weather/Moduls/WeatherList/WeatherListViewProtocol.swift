//
//  WeatherListViewProtocol.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

protocol WeatherListViewProtocol: AnyObject {
    func reloadView()
    func showLoading()
    func hideLoading()
}
