//
//  WeatherListPresenterTestCase.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import XCTest

class WeatherListPresenterTestCase: XCTestCase {

    private var sut: WeatherListPresenter!
    private var weatherListViewMock: WeatherListViewMock!
    private var weatherNetworkingService: WeatherNetworkingServiceMock!
    
    override func setUpWithError() throws {
        weatherListViewMock = WeatherListViewMock()
        weatherNetworkingService = WeatherNetworkingServiceMock()
        sut = WeatherListPresenter(view: weatherListViewMock,
                                   weatherNetworkingService: weatherNetworkingService)
    }

    override func tearDownWithError() throws {
        sut = nil
        weatherListViewMock = nil
        weatherNetworkingService = nil
    }

    func testLoadShouldCallUIMethodsAndUpdateList() {
        sut.load()
        let weatherList = sut.getList()
        
        XCTAssertTrue(weatherListViewMock.showLoadingCalled, "Show loading not called")
        XCTAssertTrue(weatherListViewMock.hideLoadingCalled, "Hide loading not called")
        XCTAssertTrue(weatherListViewMock.reloadViewCalled, "Reload view not called")
        XCTAssertEqual(weatherList?.count, 2, "Presenter list not updated")
    }
}
