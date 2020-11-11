//
//  AppDelegate.swift
//  Booksy
//
//  Created by Tomek Rybkowski on 09/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainScreen = MainViewController()

        let navigationController = UINavigationController(rootViewController: mainScreen)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
