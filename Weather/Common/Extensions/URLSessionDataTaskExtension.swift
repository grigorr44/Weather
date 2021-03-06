//
//  URLSessionDataTaskExtension.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

extension URLSessionDataTask: DataLoadProtocol {
    func cancelRequest() {
        cancel()
    }
}
