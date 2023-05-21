//
//  MainCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class MainCoordinator: AbstractCoordinator {
    weak var window: UIWindow?
    
    weak var mainViewController: UIViewController! {
        didSet {
            registerRootViewController(viewController: mainViewController)
            if let mainViewController = mainViewController {
                window?.rootViewController = mainViewController
            }
        }
    }
    
    var tabBarController: MainTabBarController? {
        mainViewController as? MainTabBarController
    }
    
    weak var todayViewController: UIViewController?
    weak var appsViewController: UIViewController?
    weak var searchViewController: UIViewController?
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    @discardableResult
    override func start() -> UIViewController {
        let mainTabBarController = MainTabBarController()
        let todayNavigationController = UINavigationController(rootViewController: TodayCoordinator().start())
        self.todayViewController = todayNavigationController
        
        mainTabBarController.viewControllers = [todayNavigationController]
        
        self.mainViewController = mainTabBarController
        return mainTabBarController
    }
}
