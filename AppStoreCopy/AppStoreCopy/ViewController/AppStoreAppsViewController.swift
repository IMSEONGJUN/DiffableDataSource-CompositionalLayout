//
//  AppStoreAppsViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit

final class AppStoreAppsViewController<ViewModel: ViewModelTypeProtocol>: MVVMCViewController {
    let viewModel: ViewModel
    
    weak var coordinator: AppsCoordinator?
    
    required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    func configureViews() {
        
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
