//
//  AlertFactory.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import UIKit

final class AlertFactory {
    
    static func `default`(title: String = "Error", message: String?) -> UIAlertController {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default))
        return alert
    }
}
