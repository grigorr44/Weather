//
//  WeatherListCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

protocol WeatherListCoordinatorProtocol: AnyObject {
    func deinitView()
    func navigateToDetails()
}

final class WeatherListCoordinator: Coordinator {
    
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    private unowned var navController: UINavigationController
    
    init(navController: UINavigationController,
         parent: Coordinator? = nil) {
        self.navController = navController
        self.parent = parent
    }
    
    func start() {
        let viewController: WeatherListViewController = Storyboard.defaultStoryboard.instantiateViewController()
        viewController.coordinator = self
        navController.pushViewController(viewController, animated: true)
    }
}

extension WeatherListCoordinator: WeatherListCoordinatorProtocol {
    func deinitView() {
        parent?.childDidFinish(self)
    }
    
    func navigateToDetails() {
        let detailsCoordinator = WeatherDetailsCoordinator(navController: navController, parent: self)
        childCoordinators.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}
