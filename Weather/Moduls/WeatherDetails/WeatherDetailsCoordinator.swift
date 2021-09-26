//
//  WeatherDetailsCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

protocol WeatherDetailsCoordinatorProtocol: AnyObject {
    func deinitView()
}

class WeatherDetailsCoordinator: Coordinator {
    
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
        
    private unowned var navController: UINavigationController
    
    init(navController: UINavigationController,
         parent: Coordinator? = nil) {
        self.navController = navController
        self.parent = parent
    }
    
    func start() {
        let viewController: WeatherDetailsViewController = Storyboard.defaultStoryboard.instantiateViewController()
        viewController.coordinator = self
        navController.pushViewController(viewController, animated: true)
    }
}

extension WeatherDetailsCoordinator: WeatherDetailsCoordinatorProtocol {
    func deinitView() {
        parent?.childDidFinish(self)
    }
}

