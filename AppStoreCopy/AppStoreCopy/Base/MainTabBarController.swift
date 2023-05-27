//
//  BaseTabBarController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit

final class MainTabBarController: UITabBarController {
    weak var mainCoordinator: MainCoordinator?
    
    init(mainCoordinator: MainCoordinator? = nil) {
        self.mainCoordinator = mainCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        tabBar.backgroundColor = .white
    }
}
