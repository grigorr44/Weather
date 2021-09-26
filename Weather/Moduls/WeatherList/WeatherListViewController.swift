//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

final class WeatherListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
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
        coordinator?.deinitView()
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

extension WeatherListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell",
                                                       for:indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        

        cell.dateLabel.text = "Sept 19"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
