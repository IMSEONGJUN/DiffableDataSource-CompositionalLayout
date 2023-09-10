//
//  AppStoreTodayViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit

final class TodayViewController: MVVMCViewController<TodayViewModel, TodayCoordinator> {
    override init(viewModel: ViewModel) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TodayViewController: ViewConfigurable, UniDirectionalBindable {
    func configureViews() {
        
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
