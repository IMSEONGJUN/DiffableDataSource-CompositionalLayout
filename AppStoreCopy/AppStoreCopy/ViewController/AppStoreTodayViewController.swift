//
//  AppStoreTodayViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit

final class AppStoreTodayViewController<ViewModel: ViewModelTypeProtocol>: MVVMViewController {
    
    let viewModel: ViewModel
    
    required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}

extension AppStoreTodayViewController {
    func configureViews() {
        
    }
}
