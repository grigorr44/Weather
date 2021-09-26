//
//  WeatherDetailsViewController.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

final class WeatherDetailsViewController: UIViewController {
    
    weak var coordinator: WeatherDetailsCoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        coordinator?.deinitView()
    }
}
