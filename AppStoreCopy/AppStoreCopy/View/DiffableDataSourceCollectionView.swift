//
//  DiffableDataSourceCollectionView.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/09.
//

import UIKit

final class DiffableDataSourceCollectionView<Section: Hashable, Item: Hashable>: UICollectionView {
    private(set) var updatableDataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    init(frame: CGRect = .zero,
         layout: UICollectionViewLayout = UICollectionViewLayout(),
         cellProvider: @escaping UICollectionViewDiffableDataSource<Section, Item>.CellProvider) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.updatableDataSource = UICollectionViewDiffableDataSource(collectionView: self, cellProvider: cellProvider)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(sectionModels: [some SectionModeling<Section, Item>], animatingDifferences: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        sectionModels.forEach {
            snapshot.appendSections([$0.section])
            snapshot.appendItems($0.items)
        }
        
        self.updatableDataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
