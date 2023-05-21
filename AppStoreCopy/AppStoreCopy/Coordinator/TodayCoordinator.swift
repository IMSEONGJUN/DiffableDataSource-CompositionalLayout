//
//  TodayCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import UIKit

final class TodayCoordinator: AbstractCoordinator {
    override func start() -> UIViewController {
        let todayViewController = AppStoreTodayViewController<AppStoreTodayViewModel>(viewModel: .init())
        todayViewController.tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "note"), tag: 0)
        return todayViewController
    }
}
