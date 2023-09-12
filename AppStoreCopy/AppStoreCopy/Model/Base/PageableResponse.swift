//
//  PageableResponse.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/09.
//

import Foundation

struct PageableResponse<Item> {
    var items: [Item]
    var more: Bool
    var page: Int
    
    enum CodingKeys: String, CodingKey {
        case items = "list"
        case more, page
    }
}

extension PageableResponse: Decodable where Item: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        items = try container.decode([Item].self, forKey: .items)
        more = try container.decode(Bool.self, forKey: .more)
        page = try container.decode(Int.self, forKey: .page)
    }
}
