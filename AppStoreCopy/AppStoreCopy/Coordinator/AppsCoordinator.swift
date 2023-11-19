//
//  AppsCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/05/11.
//

import UIKit

class AppsCoordinator: AbstractCoordinator {
    func start() -> UIViewController {
        let appsViewController = AppsViewController(viewModel: .init(),
                                                    collectionViewlayoutProvider: AppsCollectionViewLayoutProvider())
        appsViewController.coordinator = self
        appsViewController.navigationItem.title = "Apps"
        appsViewController.tabBarItem = UITabBarItem(title: "Apps", image: UIImage(systemName: "square.3.stack.3d"), tag: 0)
        
        let appsNavigationController = UINavigationController(rootViewController: appsViewController)
        appsNavigationController.navigationBar.prefersLargeTitles = true
        registerRootViewController(viewController: appsNavigationController)
        return appsNavigationController
    }
}
