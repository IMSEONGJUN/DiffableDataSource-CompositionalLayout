//
//  AppsSectionModel.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/09.
//

import Foundation

enum AppSection: Codable {
    case featured
    case normal
    case mini
}

struct AppSectionModel: SectionModeling, Codable {
    var section: AppSection
    var items: [AppItem]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(section)
    }
    
    static func ==(lhs: AppSectionModel, rhs: AppSectionModel) -> Bool {
        switch (lhs.section, rhs.section) {
        case (.featured, .featured): return true
        case (.normal, .normal): return true
        case (.mini, .mini): return true
        default: return false
        }
    }
}

protocol SectionModeling<Section, Item>: Hashable {
    associatedtype Section: Hashable
    associatedtype Item: Hashable
    
    var section: Section { get }
    var items: [Item] { get }
}
