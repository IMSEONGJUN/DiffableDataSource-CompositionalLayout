//
//  TodayCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import UIKit

final class TodayCoordinator: AbstractCoordinator {
    func start() -> UIViewController {
        let todayViewController = TodayViewController(viewModel: .init())
        todayViewController.coordinator = self
        todayViewController.navigationItem.title = "Today"
        
        let todayNavigationController = UINavigationController(rootViewController: todayViewController)
        todayNavigationController.navigationBar.prefersLargeTitles = true
        todayNavigationController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "note"), tag: 2)
        registerRootViewController(viewController: todayNavigationController)

        return todayNavigationController
    }
}
