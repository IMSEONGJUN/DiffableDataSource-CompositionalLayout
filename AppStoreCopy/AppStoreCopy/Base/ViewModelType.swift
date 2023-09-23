//
//  ViewModelProtocol.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/05/11.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input! { get }
    var output: Output! { get }
}
