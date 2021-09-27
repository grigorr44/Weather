//
//  WeatherListCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

protocol WeatherListCoordinatorProtocol: AnyObject {
    func deinitView()
    func navigateToDetails(_ weather: Weather)
}

final class WeatherListCoordinator: Coordinator {
    // MARK:- Public properties
    
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    // MARK:- Private properties
    
    private unowned var navController: UINavigationController
    
    // MARK:- Initialiser
    
    init(navController: UINavigationController,
         parent: Coordinator? = nil) {
        self.navController = navController
        self.parent = parent
    }
    
    // MARK:- Public methods
    
    func start() {
        let viewController: WeatherListViewController = Storyboard.defaultStoryboard.instantiateViewController()
        viewController.coordinator = self
        
        let networkingService = NetworkingService()
        let weatherNetworkingService = WeatherNetworkingService(networkingService)
        viewController.presenter = WeatherListPresenter(view: viewController,
                                                        weatherNetworkingService: weatherNetworkingService)
        
        navController.pushViewController(viewController, animated: true)
    }
}

extension WeatherListCoordinator: WeatherListCoordinatorProtocol {
    func deinitView() {
        parent?.childDidFinish(self)
    }
    
    func navigateToDetails(_ weather: Weather) {
        let detailsCoordinator = WeatherDetailsCoordinator(navController: navController, parent: self, weather: weather)
        childCoordinators.append(detailsCoordinator)
        detailsCoordinator.start()
    }
}
