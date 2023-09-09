//
//  AppStoreAppsViewController.swift
//  AppStoreCopy
//
//  Created by SEONGJUN on 2022/12/11.
//

import Foundation
import UIKit
import SnapKit

final class AppsViewController: MVVMCViewController<AppsViewModel, AppsCoordinator> {
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: compositionalLayout())
        collectionView.dataSource = self
        return collectionView
    }()
    
    required init(viewModel: ViewModel) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    func compositionalLayout() -> UICollectionViewCompositionalLayout {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .absolute(200)),
                                                       subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension AppsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MyCollectionViewCell.self), for: indexPath) as! MyCollectionViewCell
    }
}

class MyCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppsViewController: ViewConfigurable, UniDirectionalBindable {
    func configureViews() {
        view.addSubview(collectionView)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: MyCollectionViewCell.self))
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func bindInput() {
        
    }
    
    func bindOutput() {
        
    }
}
