//
//  AppStoreAppsViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class AppsViewController: MVVMCViewController<AppsViewModel, AppsCoordinator>, DiffableDataSourceCollectionViewUsing {
    typealias AppsCollectionView = DiffableDataSourceCollectionView
    typealias Section = AppSection
    typealias Item = AppItem
    
    let collectionView = AppsCollectionView<Section, Item>() { collectionView, indexPath, item in
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
    }
    
    let collectionViewLayoutProvider: any CollectionViewLayoutProvidable<Section, Item>
    
    init(viewModel: ViewModel, collectionViewlayoutProvider: some CollectionViewLayoutProvidable<Section, Item>) {
        self.collectionViewLayoutProvider = collectionViewlayoutProvider
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewLayout()
        
        // Temporary dummy model for test
        let appSectionModel = AppSectionModel(section: .normal,
                                              items: [AppItem(), AppItem(), AppItem(),AppItem(),AppItem(),AppItem(),AppItem(), AppItem(), AppItem(),AppItem(),AppItem(),AppItem()])
        
        update(sectionModels: [appSectionModel], animatingDifferences: true)
    }
}

extension AppsViewController: ViewConfigurable, UniDirectionalBindable {
    func configureViews() {
        view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MyCollectionViewCell.self))
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
