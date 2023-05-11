//
//  AppDelegate.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var mainCoordinator: Coordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let mainCoordinator = MainCoordinator(window: window)
        self.mainCoordinator = mainCoordinator
        mainCoordinator.start()
        return true
    }

}

