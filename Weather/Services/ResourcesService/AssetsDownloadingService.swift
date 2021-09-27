//
//  AssetsDownloadingService.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import Foundation

protocol AssetsDownloadingServiceProtocol: AnyObject {
    @discardableResult
    func getWeatherIcon(path: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) -> DataLoadProtocol?
}

protocol DataLoadProtocol {
    func cancelRequest()
}

final class AssetsDownloadingService: AssetsDownloadingServiceProtocol {
    // MARK:- Private properties
    
    private var dataCache = UserDefaults.standard
    private let iconPath =  "/img/wn/"
    
    // MARK:- Public methods
    
    func getWeatherIcon(path: String, completion: @escaping (Data?, Error?) -> Void) -> DataLoadProtocol? {
        
        let urlString = Configs.assetsBaseURL + iconPath + path + "@\(Configs.scale)x.png"
        
        return loadData(urlString: urlString) { data, error in
            completion(data, error)
        }
    }
    
    // MARK:- Private methods
    
    private func loadData(urlString: String, completion: @escaping (Data?, Error?) -> Void) -> DataLoadProtocol? {
        
        if let storedData = dataCache.data(forKey: urlString){
            completion(storedData, nil)
            return nil
        }
        
        guard let url = URL(string: urlString) else { completion(nil, nil); return nil }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async { [weak self] in
                self?.dataCache.set(data, forKey: urlString)
                completion(data, nil)
            }
        }
        
        task.resume()
        return task
    }
}
