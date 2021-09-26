//
//  AppDelegate.swift
//  Weather
//
//  Created by Grigor Grigoryan on 24.09.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        appCoordinator = AppCoordinator(window: UIWindow())
        appCoordinator?.start()
        return true
    }
}

