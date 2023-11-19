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
    
    weak var todayCoordinator: AbstractCoordinator?
    weak var searchCoordinator: AbstractCoordinator?
    weak var appsCoordinator: AbstractCoordinator?
    
    func start() -> UIViewController {
        let mainTabBarController = MainTabBarController(mainCoordinator: self)
        
        let appsCoordinator = AppsCoordinator()
        let appsNavigationContoller = appsCoordinator.start()
        self.appsViewController = appsNavigationContoller
        self.appsCoordinator = appsCoordinator
        
        let searchCoordinator = SearchCoordinator()
        let searchNavigationController = searchCoordinator.start()
        self.searchViewController = searchNavigationController
        self.searchCoordinator = searchCoordinator
        
        let todayCoordinator = TodayCoordinator()
        let todayNavigationController = todayCoordinator.start()
        self.todayViewController = todayNavigationController
        self.todayCoordinator = todayCoordinator
        
        mainTabBarController.viewControllers = [searchNavigationController, appsNavigationContoller, todayNavigationController]
        
        registerRootViewController(viewController: mainTabBarController)
        return mainTabBarController
    }
}
