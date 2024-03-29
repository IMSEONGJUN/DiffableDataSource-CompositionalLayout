//
//  BaseMVVMViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/05/11.
//

import UIKit
import RxSwift

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
    associatedtype ViewModel: ViewModelType
    var viewModel: ViewModel { get }
}

protocol HasCoordinator {
    associatedtype T: Coordinator
    var coordinator: T? { get }
}

class BaseViewController: UIViewController, HasDisposeBag {
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

class MVVMCViewController<ViewModel: ViewModelType, C: Coordinator>: BaseViewController, HasViewModel, HasCoordinator {
    let viewModel: ViewModel
    weak var coordinator: C?
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MVVMViewController<VM: ViewModelType>: BaseViewController, HasViewModel {
    let viewModel: VM
    
    required init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
