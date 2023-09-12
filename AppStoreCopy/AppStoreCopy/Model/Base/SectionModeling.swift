//
//  SectionModeling.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/12.
//

import Foundation

protocol SectionModeling<Section, Item>: Hashable {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    var section: Section { get }
    var items: [Item] { get }
}
