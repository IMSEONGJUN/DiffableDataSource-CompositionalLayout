//
//  CollectionViewLayoutComposer.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import UIKit

class AppsCollectionViewLayoutProvider: CollectionViewLayoutProvidable {
    func createLayout(dataSource: UICollectionViewDiffableDataSource<AppSection, AppItem>) -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .absolute(200)),
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
