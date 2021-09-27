//
//  WeatherNetworkingServiceTestCase.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import XCTest

class WeatherNetworkingServiceTestCase: XCTestCase {

    private var sut: WeatherNetworkingService!
    private var networkingServiceMock: NetworkingServiceMock!
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        sut = nil
        networkingServiceMock = nil
    }

    func testGetWeatherListShouldReturnCorrectList() {
        networkingServiceMock = NetworkingServiceMock("WeatherList")
        sut = WeatherNetworkingService(networkingServiceMock)
        
        sut.getWeatherList(country: "Paris", count: 1) { weatherList, error in
            XCTAssertEqual(weatherList?.cityName, "Paris", "Server returned weather list but we couldn't parse")
            XCTAssertEqual(weatherList?.cityCoordinate.latitude, 48.8534, "Server returned weather list but we couldn't parse")
            XCTAssertEqual(weatherList?.cityCoordinate.longitude, 2.3488, "Server returned weather list but we couldn't parse")
            XCTAssertEqual(weatherList?.weatherList.count, 16, "Server returned weather list but we couldn't parse")
            XCTAssertNil(error, "Server returned weather list but error is not nil")
        }
    }
}
