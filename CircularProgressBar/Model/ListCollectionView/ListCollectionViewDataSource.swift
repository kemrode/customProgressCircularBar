//
//  ListCollectionViewDataSource.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 16/09/2023.
//

import UIKit

class ListCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
// MARK: - Properties
    private var _products: [Product] = []
    
// MARK: - Constructor
    
    init(products: [Product]){
        self._products = products
    }
    
// MARK: - CollectionView Methods
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCell", for: indexPath) as? ListCell else {
            let cell = UICollectionViewCell()
            cell.backgroundColor = .red
            return cell
        }
        let product = self._products[indexPath.item]
        cell.productNameLabel.text = product.name
        cell.selectedProductButton.tintColor = product.selected ? .green : .gray
        return cell
    }
    
    public func updateProducts(newProducts: [Product]) {
        self._products = newProducts
    }
    
}
