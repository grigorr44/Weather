//
//  Storyboard.swift
//  Weather
//
//  Created by Grigor Grigoryan on 25.09.21.
//

import UIKit

enum Storyboard: String {
    case main = "Main"
    
    static var defaultStoryboard: UIStoryboard {
        return UIStoryboard(name: Storyboard.main.rawValue, bundle: nil)
    }
}

extension UIStoryboard {
    func instantiateViewController<T>(withIdentifier identifier: String = String(describing: T.self)) -> T {
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
