//
//  AppCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 24.09.21.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    // MARK:- Public properties
    
    var childCoordinators: [Coordinator] = []
    var parent: Coordinator?

    // MARK:- Private properties
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    private var weatherListCoordinator: WeatherListCoordinator?
    
    
    // MARK:- Initialiser
    
    init(window: UIWindow,
         navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    // MARK:- Public methods
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        weatherListCoordinator = WeatherListCoordinator(navController: navigationController, parent: self)
        weatherListCoordinator?.start()
    }
}
