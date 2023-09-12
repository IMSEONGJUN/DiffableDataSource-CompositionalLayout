//
//  AppSectionModel.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/12.
//

import Foundation

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
