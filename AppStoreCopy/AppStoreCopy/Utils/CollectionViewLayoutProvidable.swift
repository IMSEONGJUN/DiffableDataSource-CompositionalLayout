//
//  CollectionViewLayoutProvidable.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import UIKit

protocol CollectionViewLayoutProvidable<Section, Item> {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    func createLayout(dataSource: UICollectionViewDiffableDataSource<Section, Item>) -> UICollectionViewLayout
}
