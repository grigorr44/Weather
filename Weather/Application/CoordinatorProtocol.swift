//
//  CoordinatorProtocol.swift
//  Weather
//
//  Created by Grigor Grigoryan on 24.09.21.
//

import Foundation

protocol Coordinator: AnyObject {
    var parent: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    func start()
    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
