//
//  ListCollectionView.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 16/09/2023.
//

import UIKit

class ListCollectionView: UICollectionView {
    
// MARK: - Properties
    
    private var _parent: CircularViewController!
    
// MARK: - Constructor
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUpCollectionView()
    }
    
// MARK: - private Methods
    
    private func setUpCollectionView() {
        self.showsVerticalScrollIndicator = false
        self.backgroundColor = .white
        let flowLayout = UICollectionViewCompositionalLayout(section: ListCollectionViewSection().setSection())
        self.setCollectionViewLayout(flowLayout, animated: true)
    }
}
