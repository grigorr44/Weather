//
//  WeatherListViewMock.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

class WeatherListViewMock: WeatherListViewProtocol {
    
    var reloadViewCalled = false
    var showLoadingCalled = false
    var hideLoadingCalled = false
    
    func reloadView() {
        reloadViewCalled = true
    }
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
}
