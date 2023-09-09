//
//  AppsCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/05/11.
//

import UIKit

class AppsCoordinator: AbstractCoordinator {
    func start() -> UIViewController {
        let viewController = AppsViewController(viewModel: .init())
        viewController.coordinator = self
        registerRootViewController(viewController: viewController)
        viewController.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "square.3.stack.3d"), tag: 1)
        return viewController
    }
}
