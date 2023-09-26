//
//  RoundedButton.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 16/09/2023.
//

import UIKit

class RoundedButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setRoundedButton()
    }
    
// MARK: - Private Methods
    
    private func setRoundedButton() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.setTitle("", for: .normal)
    }

// MARK: - Public Method
    
    public func setSelectedButtonTintColor(selected: Bool) {
        self.tintColor = selected ? .green : .white
    }
}
