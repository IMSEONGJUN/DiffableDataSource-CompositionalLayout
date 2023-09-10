//
//  AppStoreAppsViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import SnapKit

@available(iOS 16.0.0, *)
protocol CollectionViewUsing<Section, Item> {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    var collectionView: DiffableDataSourceCollectionView<Section, Item> { get }
    func update(sectionModels: [any SectionModeling<Section, Item>])
}

final class AppsViewController: MVVMCViewController<AppsViewModel, AppsCoordinator> {
    typealias AppsCollectionView = DiffableDataSourceCollectionView
    
    private lazy var collectionView = AppsCollectionView<AppSection, AppItem>() { collectionView, indexPath, item in
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
    }
    
    private let collectionViewLayoutProvider: any CollectionViewLayoutProvidable<AppSection, AppItem>
    
    init(viewModel: ViewModel, collectionViewlayoutProvider: any CollectionViewLayoutProvidable<AppSection, AppItem>) {
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
                                              items: [AppItem(), AppItem(), AppItem(),AppItem(),AppItem(),AppItem()])
        update(sectionModels: [appSectionModel])
    }
    
    private func setCollectionViewLayout() {
        if let dataSource = collectionView.updatableDataSource {
            collectionView.collectionViewLayout = collectionViewLayoutProvider.createLayout(dataSource: dataSource)
        }
    }
    
    private func update(sectionModels: [AppSectionModel]) {
        self.collectionView.apply(sectionModels: sectionModels, animatingDifferences: true)
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
