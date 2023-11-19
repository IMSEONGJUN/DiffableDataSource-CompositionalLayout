//
//  ApiProvider.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import Foundation
import Moya
import RxSwift
import RxCocoa

enum ApiProvider {
    private static let provider: MoyaProvider<MultiTarget> = {
        let provider = MoyaProvider<MultiTarget>()
        return provider
    }()
    
    static func request(target: TargetType) -> Single<Response> {
        Single<Response>.create { single in
            provider.request(MultiTarget(target)) { result in
                switch result {
                case .success(let response):
                    single(.success(response))
                case .failure(let error):
                    single(.failure(error))
                    break
                }
            }
            return Disposables.create()
        }
    }
}
