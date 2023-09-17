//
//  CollectionViewUsing.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import UIKit
import RxSwift
import RxCocoa

protocol DiffableDataSourceCollectionViewUsing {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    var collectionView: DiffableDataSourceCollectionView<Section, Item> { get }
    var collectionViewLayoutProvider: any CollectionViewLayoutProvidable<Section, Item> { get }
    
    func setCollectionViewLayout()
    func update(sectionModels: [some SectionModeling<Section, Item>], animatingDifferences: Bool)
}

extension DiffableDataSourceCollectionViewUsing {
    func setCollectionViewLayout() {
        if let dataSource = collectionView.updatableDataSource {
            collectionView.collectionViewLayout = collectionViewLayoutProvider.createLayout(dataSource: dataSource)
        }
    }
    
    func update(sectionModels: [some SectionModeling<Section, Item>], animatingDifferences: Bool) {
        self.collectionView.apply(sectionModels: sectionModels, animatingDifferences: animatingDifferences)
    }
}
