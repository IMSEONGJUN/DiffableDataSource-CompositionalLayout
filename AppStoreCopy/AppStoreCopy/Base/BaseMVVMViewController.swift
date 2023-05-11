//
//  BaseMVVMViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/05/11.
//

import UIKit
import RxSwift

typealias MVVMViewController = BaseMVVMViewController & ViewConfigurable & UniDirectionalBindable & HasViewModel

protocol ViewConfigurable: AnyObject {
    func configureViews()
}

protocol UniDirectionalBindable: AnyObject {
    func bindInput()
    func bindOutput()
}

protocol HasDisposeBag: AnyObject {
    var disposeBag: DisposeBag { get }
}

protocol HasViewModel: AnyObject {
    associatedtype ViewModel: ViewModelTypeProtocol
    var viewModel: ViewModel { get }
    
    init(viewModel: ViewModel)
}

class BaseMVVMViewController: UIViewController, HasDisposeBag {
    var disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        (self as? ViewConfigurable)?.configureViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self as? UniDirectionalBindable)?.bindInput()
        (self as? UniDirectionalBindable)?.bindOutput()
    }
}


