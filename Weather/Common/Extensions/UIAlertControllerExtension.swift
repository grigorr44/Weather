//
//  UIAlertControllerExtension.swift
//  Weather
//
//  Created by Grigor Grigoryan on 26.09.21.
//

import UIKit

extension UIAlertController {
    func show() {
        if let window: UIWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            window.rootViewController?.present(self,
                                               animated: true,
                                               completion: nil)
        }
    }
}
