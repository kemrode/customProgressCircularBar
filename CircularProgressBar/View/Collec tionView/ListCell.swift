//
//  ListCell.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 16/09/2023.
//

import UIKit

class ListCell: UICollectionViewCell {
    
// MARK: - IBOutlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var selectedProductButton: RoundedButton!
    
// MARK: - Configuration
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        var backgroundConfiguration = UIBackgroundConfiguration.listPlainCell().updated(for: state)
        backgroundConfiguration.backgroundColor = .white
        self.backgroundConfiguration = backgroundConfiguration
        self.setProductNameLabel()
    }
    
// MARK: - Private Methods
    
    private func setProductNameLabel() {
        self.productNameLabel.textColor = .darkGray
        self.productNameLabel.textAlignment = .left
        self.productNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    
}
