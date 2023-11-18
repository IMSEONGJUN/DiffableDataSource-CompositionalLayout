//
//  DiffableDataSourceCollectionView.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/09.
//

import UIKit

final class DiffableDataSourceCollectionView<Section: Hashable, Item: Hashable>: UICollectionView {
    private var diffableDataSource: UICollectionViewDiffableDataSource<Section, Item>?
    
    init(frame: CGRect = .zero,
         layoutProvider: some CollectionViewLayoutProvidable<Section, Item>,
         cellProvider: @escaping UICollectionViewDiffableDataSource<Section, Item>.CellProvider) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        self.diffableDataSource = UICollectionViewDiffableDataSource(collectionView: self, cellProvider: cellProvider)
        collectionViewLayout = layoutProvider.createLayout(dataSource: diffableDataSource)
    }

    deinit {
        print("deinit DiffableDataSourceCollectionView")
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
        
        self.diffableDataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    func item(for indexPath: IndexPath) -> Item? {
        return diffableDataSource?.itemIdentifier(for: indexPath)
    }
}
