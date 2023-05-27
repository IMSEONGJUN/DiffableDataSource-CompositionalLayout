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
    var tabBarController: MainTabBarController? {
        rootViewController as? MainTabBarController
    }
    
    weak var todayViewController: UIViewController?
    weak var appsViewController: UIViewController?
    weak var searchViewController: UIViewController?
    
    func start() -> UIViewController {
        let mainTabBarController = MainTabBarController(mainCoordinator: self)
        
        let todayNavigationController = UINavigationController(rootViewController: TodayCoordinator().start())
        self.todayViewController = todayNavigationController
        
        let appsNavigationContoller = UINavigationController(rootViewController: AppsCoordinator().start())
        self.appsViewController = appsNavigationContoller
        
        mainTabBarController.viewControllers = [todayNavigationController, appsNavigationContoller]
        
        registerRootViewController(viewController: mainTabBarController)
        return mainTabBarController
    }
}
