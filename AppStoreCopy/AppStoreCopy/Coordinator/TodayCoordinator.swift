//
//  TodayCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import UIKit

final class TodayCoordinator: AbstractCoordinator {
    func start() -> UIViewController {
        let todayViewController = AppStoreTodayViewController(viewModel: .init())
        todayViewController.coordinator = self
        todayViewController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "note"), tag: 0)
        registerRootViewController(viewController: todayViewController)

        return todayViewController
    }
}
