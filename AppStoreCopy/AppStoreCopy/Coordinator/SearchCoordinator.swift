//
//  SearchCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 11/18/23.
//

import UIKit

final class SearchCoordinator: AbstractCoordinator {
    func start() -> UIViewController {
        let searchViewModel = SearchViewModel()
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        searchViewController.coordinator = self
        
        searchViewController.navigationItem.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let appsNavigationController = UINavigationController(rootViewController: searchViewController)
        appsNavigationController.navigationBar.prefersLargeTitles = true
        registerRootViewController(viewController: appsNavigationController)
        return appsNavigationController
    }
}
