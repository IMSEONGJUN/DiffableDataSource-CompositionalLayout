//
//  CollectionViewUsing.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import UIKit

protocol DiffableDataSourceCollectionViewUsing {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    var collectionView: DiffableDataSourceCollectionView<Section, Item> { get }
    var collectionViewLayoutProvider: any CollectionViewLayoutProvidable<Section, Item> { get }
    
    func setCollectionViewLayout()
    func update(sectionModels: [some SectionModeling<Section, Item>])
}
