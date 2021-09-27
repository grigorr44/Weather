//
//  WeatherTableViewCellProtocol.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

protocol WeatherTableViewCellProtocol: AnyObject {
    func setDate(_ text: String)
    func setDayTmpr(_ tmp: String)
    func setNightTmpr(_ tmp: String)
    func setStatusIcon(_ iconData: Data)
    func setStatusText(_ text: String)
}
