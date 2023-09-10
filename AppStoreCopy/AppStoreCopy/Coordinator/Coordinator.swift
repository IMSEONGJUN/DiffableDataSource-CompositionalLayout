//
//  Coordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol Coordinator: AnyObject, HasDisposeBag {
    var rootViewController: UIViewController? { get set }
    var disposeBag: DisposeBag { get }
    
    func start() -> UIViewController
}

extension Coordinator {
    func registerRootViewController(viewController: UIViewController) {
        self.rootViewController = viewController
        
        // rootViewController가 deallocated 될 때 해당 뷰컨의 coordinator도 함께 deinit되도록 strong capure.
        rootViewController?.rx.deallocated
            .subscribe(onNext: {
                self.noOp()
            })
            .disposed(by: disposeBag)
    }
    
    func noOp() {}
    
    func start() -> UIViewController {
        return UIViewController()
    }
}
