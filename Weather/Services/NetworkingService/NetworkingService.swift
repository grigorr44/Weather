//
//  NetworkingService.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

enum RequestMethod: Int {
    case GET
    case POST
}

protocol NetworkingServiceProtocol: AnyObject {
    func request(_ requestMethod: RequestMethod,
                 path: String,
                 parameters: [String: Any]?,
                 completion: @escaping (_ data: Data?, _ error: Error?) -> Void)
}

final class NetworkingService: NetworkingServiceProtocol {
    // MARK:- Public methods
    
    func request(_ requestMethod: RequestMethod,
                 path: String,
                 parameters: [String: Any]?,
                 completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        
        guard var urlComponents = URLComponents(string: Configs.apiBaseURL + path) else {
            completion(nil, ErrorType.urlNotCorrect)
            return
        }
        
        let params = appendGlobalRequestParameters(with: parameters)
        urlComponents.queryItems = []
        for (key, value) in params {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            urlComponents.queryItems?.append(queryItem)
        }
        
        guard let url = urlComponents.url else {
            completion(nil, ErrorType.urlNotCorrect)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, ErrorType.generic)
                    return
                }
                completion(data, nil)
            }
        }.resume()
    }
    
    // MARK:- Private methods
    
    private func appendGlobalRequestParameters(with params: [String: Any]?) -> [String: Any] {
        var parameters = params
        if parameters == nil {
            parameters = [String: Any]()
        }
        
        parameters?["APPID"] = Configs.apiKey
        return parameters ?? [String: Any]()
    }
}
