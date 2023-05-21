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
    
    @discardableResult
    func start() -> UIViewController
}

extension Coordinator {
    func registerRootViewController(viewController: UIViewController) {
        self.rootViewController = viewController
        
        rootViewController?.rx.deallocated
            .subscribe(onNext: {
                self.noOp()
            })
            .disposed(by: disposeBag)
    }
    
    func noOp() {}
}
