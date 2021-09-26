//
//  AppCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 24.09.21.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var parent: Coordinator?

    private let window: UIWindow
    private let navigationController: UINavigationController
    
    private var weatherListCoordinator: WeatherListCoordinator?
    
    
    init(window: UIWindow,
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        weatherListCoordinator = WeatherListCoordinator(navController: navigationController, parent: self)
        weatherListCoordinator?.start()
    }
}
