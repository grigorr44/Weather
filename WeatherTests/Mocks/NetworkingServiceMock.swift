//
//  NetworkingServiceMock.swift
//  WeatherTests
//
//  Created by Grigor Grigoryan on 27.09.21.
//

import Foundation

class NetworkingServiceMock: NetworkingServiceProtocol {
    
    private var jsonFileName: String
    
    init(_ jsonFileName: String) {
        self.jsonFileName = jsonFileName
    }
    
    func request(_ requestMethod: RequestMethod,
                 path: String,
                 parameters: [String: Any]?,
                 completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let jsonFilePath = Bundle(for: WeatherTests.self).url(forResource: jsonFileName, withExtension: "json") else {
            completion(nil, ErrorType.generic)
            return
        }
        do {
            let data = try Data(contentsOf: jsonFilePath, options: .mappedIfSafe)
            completion(data, nil)
        } catch {
            completion(nil, ErrorType.generic)
        }
    }
}
