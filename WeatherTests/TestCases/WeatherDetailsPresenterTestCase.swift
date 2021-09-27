//
//  WeatherDetailsPresenterTestCase.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import XCTest

class WeatherDetailsPresenterTestCase: XCTestCase {
    
    private var sut: WeatherDetailsPresenter!
    private var weatherDetailsViewMock: WeatherDetailsViewMock!

    override func setUpWithError() throws {
        weatherDetailsViewMock = WeatherDetailsViewMock()
    }

    override func tearDownWithError() throws {
        sut = nil
        weatherDetailsViewMock = nil
    }

    func testLoadCallCorrectFuntions() {
        sut = WeatherDetailsPresenter(view: weatherDetailsViewMock,
                                      weather: WeatherMock.averageDayWeather)
        
        sut.load()
        
        XCTAssertEqual(weatherDetailsViewMock.temperature, "15", "Temperature not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.status, "Rainy", "Status not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.date, "September 27", "Date not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.nightTemp, "12", "Night Temp not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.dayTemp, "15", "Day Temp not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.rotateWindArrow, 0.40840703, "Wind arrow rotation angle not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.pressure, "13.0", "Pressure not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.humidity, "14.5", "Humidity not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.visibility, "12.8", "Visibility not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.sunriseDate, "18:00", "Sunrise date not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.sunsetDate, "18:32", "Sunset date not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.dayStatus, "", "Day status not set correctly")
        XCTAssertEqual(weatherDetailsViewMock.nightStatus, "", "Night status not set correctly")
    }
    
    func testDayTemperatureStatusShouldBeHotIfAboveGivenNumber() {
        sut = WeatherDetailsPresenter(view: weatherDetailsViewMock,
                                      weather: WeatherMock.hotDayWeather)
        
        sut.load()
        
        XCTAssertEqual(weatherDetailsViewMock.dayStatus, "Hot", "Day status not set correctly")
    }
    
    func testDayTemperatureStatusShouldBeColdIfBelowGivenNumber() {
        sut = WeatherDetailsPresenter(view: weatherDetailsViewMock,
                                      weather: WeatherMock.coldDayWeather)
        
        sut.load()
        XCTAssertEqual(weatherDetailsViewMock.dayStatus, "Cold", "Day status not set correctly")
    }
    
    func testNightTemperatureStatusShouldBeHotIfAboveGivenNumber() {
        sut = WeatherDetailsPresenter(view: weatherDetailsViewMock,
                                      weather: WeatherMock.hotNightWeather)
        
        sut.load()
        
        XCTAssertEqual(weatherDetailsViewMock.nightStatus, "Hot", "Night status not set correctly")
    }
    
    func testNightTemperatureStatusShouldBeColdIfBelowGivenNumber() {
        sut = WeatherDetailsPresenter(view: weatherDetailsViewMock,
                                      weather: WeatherMock.coldNightWeather)
        
        sut.load()
        
        XCTAssertEqual(weatherDetailsViewMock.nightStatus, "Cold", "Night status not set correctly")
    }
}
