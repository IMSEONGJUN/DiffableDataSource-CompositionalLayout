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
    associatedtype ViewModel: ViewModelType

    var collectionView: DiffableDataSourceCollectionView<Section, Item> { get }
    var collectionViewLayoutProvider: any CollectionViewLayoutProvidable<Section, Item> { get }

    init(viewModel: ViewModel, collectionViewlayoutProvider: some CollectionViewLayoutProvidable<Section, Item>)
    func update(sectionModels: [some SectionModeling<Section, Item>], animatingDifferences: Bool)
}

extension DiffableDataSourceCollectionViewUsing {
    func update(sectionModels: [some SectionModeling<Section, Item>], animatingDifferences: Bool) {
        self.collectionView.apply(sectionModels: sectionModels, animatingDifferences: animatingDifferences)
    }
}
