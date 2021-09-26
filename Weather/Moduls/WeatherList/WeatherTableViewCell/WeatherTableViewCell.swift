//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import UIKit

final class WeatherTableViewCell: UITableViewCell {
    // MARK:- IBOutlets
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayTmprLabel: UILabel!
    @IBOutlet weak var nightTmprLabel: UILabel!
    @IBOutlet weak var statusIcon: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK:- Private properties
    
    private var presenter: WeatherTableViewCellPresenter?
        
    override func prepareForReuse() {
        super.prepareForReuse()
//        presenter?.prepareForReuse()
    }
    
    // MARK:- Public methods
    
    func load() {
//        presenter?.load()
    }
}

extension WeatherTableViewCell: WeatherTableViewCellProtocol {
    func setDateText(_ text: String) {
        dateLabel.text = text
    }
    
    func setDayTmpr(_ tmp: String) {
        dayTmprLabel.text = tmp
    }
    
    func setNightTmpr(_ tmp: String) {
        nightTmprLabel.text = tmp
    }
    
    func setStatusIcon(_ iconData: Data) {
        statusIcon.image = UIImage(data: iconData)
    }
    
    func setStatusText(_ text: String) {
        statusLabel.text = text
    }
}
