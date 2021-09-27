//
//  WeatherDetailsViewController.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

final class WeatherDetailsViewController: UIViewController {
    // MARK:- IBOutlets
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nightTemp: UILabel!
    @IBOutlet weak var dayTemp: UILabel!
    @IBOutlet weak var statusDescription: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var windArrowImageView: UIImageView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var sunriseDateLabel: UILabel!
    @IBOutlet weak var sunsetDateLabel: UILabel!
    
    // MARK:- Public properties
    
    weak var coordinator: WeatherDetailsCoordinatorProtocol?
    var presenter: WeatherDetailsPresenter?
    
    // MARK:- Initialiser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupBlurEffect()
    }
    
    // MARK:- Deinitialization
    
    deinit {
        coordinator?.deinitView()
    }
    
    // MARK:- Private methods
    
    private func setupBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurEffectView)
    }
    
    // MARK:- IBOutletActions
    
    @IBAction func backButtonAction(_ sender: Any) {
        coordinator?.goBack()
    }
}

extension WeatherDetailsViewController: WeatherDetailsViewProtocol {
    func setDate(_ text: String) {
        dateLabel.text = text
    }
    
    func setTemperature(_ temp: String) {
        temperatureLabel.text = temp
    }
    
    func setStatus(_ text: String) {
        statusLabel.text = text
    }
    
    func setNightTemp(_ temp: String) {
        nightTemp.text = temp
    }
    
    func setDayTemp(_ temp: String) {
        dayTemp.text = temp
    }
    
    func setStatusDescription(_ text: String) {
        statusDescription.text = text
    }
    
    func rotateWindArrow(_ radians: Float) {
        UIView.animate(withDuration:1.0, animations: { [weak self] in
            self?.windArrowImageView.transform = CGAffineTransform(rotationAngle: CGFloat(radians))
        })
    }
    
    func setPressure(_ text: String) {
        pressureLabel.text = text
    }
    
    func setHumidity(_ text: String) {
        humidityLabel.text = text
    }
    
    func setVisibility(_ text: String) {
        visibilityLabel.text = text
    }
    
    func setSunriseDate(_ text: String) {
        sunriseDateLabel.text = text
    }
    
    func setSunsetDate(_ text: String) {
        sunsetDateLabel.text = text
    }
}
