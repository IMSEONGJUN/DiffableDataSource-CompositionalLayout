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
    
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }
    
    @discardableResult
    func start() -> UIViewController {
        let mainTabBarController = MainTabBarController()
        self.mainViewController = mainTabBarController
        return mainTabBarController
    }
}
