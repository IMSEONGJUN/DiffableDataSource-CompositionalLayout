//
//  MyCollectionViewCell.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2023/09/10.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
