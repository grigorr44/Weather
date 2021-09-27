//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

final class WeatherListViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK:- Public properties
    
    weak var coordinator: WeatherListCoordinatorProtocol?
    var presenter: WeatherListPresenter?
    
    // MARK:- Initialiser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.load()
    }
    
    // MARK:- Deinitialization
    
    deinit {
        coordinator?.deinitView()
    }
}

extension WeatherListViewController: WeatherListViewProtocol {
    func reloadView() {
        tableView.reloadData()
    }
    
    func showLoading() {
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
    }
}

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getList()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell",
                                                       for:indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        
        if let weather = presenter?.getList()?[indexPath.row] {
            cell.coordinator = coordinator
            cell.configureView(weather: weather)
            cell.load()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let weather = presenter?.getList()?[indexPath.row] {
            coordinator?.navigateToDetails(weather)
        }
    }
}
