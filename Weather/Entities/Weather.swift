//
//  Weather.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

struct Weather {
    let id: Int?
    let date: Date
    let dayTemp: Int
    let nightTemp: Int
    let status: String?
    let statusDescription: String?
    let statusIcon: String?
    let pressure: Float?
    let humidity: Float?
    let speed: Float?
    let windDegree: Float?
    let sunriseDate: Date
    let sunsetDate: Date
}
