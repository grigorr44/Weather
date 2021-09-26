//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

final class WeatherListViewController: UIViewController {
    
    weak var coordinator: WeatherListCoordinatorProtocol?
    
    // MARK:- Private properties
    private var presenter: WeatherListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        coordinator?.navigateToDetails()
    }
    
    deinit {
        presenter.deinitView()
    }
}

extension WeatherListViewController: WeatherListViewProtocol {
    func reloadView() {
        
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
}
    
