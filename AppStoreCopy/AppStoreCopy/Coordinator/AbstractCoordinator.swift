//
//  AbstractCoordinator.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import RxSwift
import RxCocoa

class AbstractCoordinator: Coordinator {
    weak var rootViewController: UIViewController?
    var disposeBag = DisposeBag()
    
    deinit {
        print("@@@ Deinit \(self)")
    }
}
