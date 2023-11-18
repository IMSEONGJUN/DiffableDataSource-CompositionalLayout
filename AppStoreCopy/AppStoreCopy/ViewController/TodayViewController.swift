//
//  AppStoreTodayViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import RxSwift

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
        let button = UIButton()
        view.addSubview(button)
        button.rx.tap
            .subscribe(with: self) { owner, _ in
                owner.present(AppsViewController(viewModel: AppsViewModel(), collectionViewlayoutProvider: AppsCollectionViewLayoutProvider()), animated: true)
            }
            .disposed(by: disposeBag)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
        button.setTitle("TAP", for: .normal)
        button.backgroundColor = .red
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
