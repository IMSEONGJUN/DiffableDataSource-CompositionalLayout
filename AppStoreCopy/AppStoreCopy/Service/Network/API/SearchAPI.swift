//
//  SearchAPI.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 11/19/23.
//

import Foundation
import Moya

enum SearchAPI {
    case search(String)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        return "search"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .search(let keyword):
            .requestParameters(parameters: ["term": keyword], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        nil
    }
}
