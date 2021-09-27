//
//  WeatherDetailsCoordinator.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

protocol WeatherDetailsCoordinatorProtocol: AnyObject {
    func goBack()
    func deinitView()
}

class WeatherDetailsCoordinator: Coordinator {
    // MARK:- Public properties
    
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    
    // MARK:- Private properties
    
    private unowned var navController: UINavigationController
    private var weather: Weather
    
    // MARK:- Initialiser
    
    init(navController: UINavigationController,
         parent: Coordinator? = nil,
         weather: Weather) {
        self.navController = navController
        self.parent = parent
        self.weather = weather
    }
    
    // MARK:- Public methods
    
    func start() {
        let viewController: WeatherDetailsViewController = Storyboard.defaultStoryboard.instantiateViewController()
        let presenter = WeatherDetailsPresenter(view: viewController, weather: weather)
        viewController.coordinator = self
        viewController.presenter = presenter
        navController.pushViewController(viewController, animated: true)
    }
}

extension WeatherDetailsCoordinator: WeatherDetailsCoordinatorProtocol {
    func goBack() {
        navController.popViewController(animated: true)
    }
    
    func deinitView() {
        parent?.childDidFinish(self)
    }
}

