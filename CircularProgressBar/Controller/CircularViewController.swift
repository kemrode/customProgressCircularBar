//
//  CircularViewController.swift
//  CircularProgressBar
//
//  Created by kevin fichou on 15/09/2023.
//

import UIKit

class CircularViewController: UIViewController {
    
// MARK: - IBOutlets
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var animatedCircularCountingLabel: UILabel!
    @IBOutlet weak var listCollectionView: ListCollectionView!
    
// MARK: - Properties
    
    private var _circularProgressBarView: CircularProgressBarView!
    private var _circularDuration: TimeInterval = 2
    private var _products: [Product] = []
    private var _listCollectionViewDataSource: ListCollectionViewDataSource!
    private var _completionPercentage: Double! = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLable.text = "Test de barre de progression circulaire"
        self.setUpCircularProgressBarView()
        self.setProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setListCollectionViewDataSource()
        self.animatedCircularCountingLabel.text = String(self._completionPercentage)
    }

// MARK: - Private Methods
    
    private func setUpCircularProgressBarView() {
        self._circularProgressBarView = CircularProgressBarView(frame: .zero)
        self._circularProgressBarView.center = self.animatedCircularCountingLabel.center
        self._circularProgressBarView.progressAnimation(duration: self._circularDuration)
        self.view.addSubview(self._circularProgressBarView)
    }
    
    private func setListCollectionViewDataSource() {
        self._listCollectionViewDataSource = ListCollectionViewDataSource(products: self._products)
        self.listCollectionView.dataSource = self._listCollectionViewDataSource
    }
    
    private func setProducts() {
        let pasta: Product = Product(name: "pasta", selected: true)
        self._products.append(pasta)
        let sauceBolognaise: Product = Product(name: "sauce bolognaise", selected: false)
        self._products.append(sauceBolognaise)
        let riz: Product = Product(name: "riz", selected: false)
        self._products.append(riz)
        let semoule: Product = Product(name: "semoule", selected: false)
        self._products.append(semoule)
        let poisChiche: Product = Product(name: "pois chiche", selected: false)
        self._products.append(poisChiche)
        let merguez: Product = Product(name: "merguez", selected: false)
        self._products.append(merguez)
        let aubergine: Product = Product(name: "aubergine", selected: false)
        self._products.append(aubergine)
        let couches: Product = Product(name: "couches", selected: false)
        self._products.append(couches)
        let laitBebe: Product = Product(name: "lait bébé", selected: false)
        self._products.append(laitBebe)
        let eau: Product = Product(name: "eau", selected: false)
        self._products.append(eau)
    }
    
    private func getSelectedCell(_ sender: RoundedButton) -> ListCell {
        var superView = sender.superview
        while let view = superView, !(view is ListCell) {
            superView = view.superview
        }
        guard let cell = superView as? ListCell else {
            return ListCell()
        }
        return cell
    }
    
    @IBAction func slectItemAtIndexPath(_ sender: RoundedButton) {
        let cell = self.getSelectedCell(sender)
        self.onProductSelected(cell: cell)
        self.listCollectionView.reloadData()
    }
    
    private func onProductSelected(cell: ListCell) {
        self._products.indices.forEach {
            if self._products[$0].name == cell.productNameLabel.text {
                self._products[$0].selected = true
            }
        }
        self._listCollectionViewDataSource.updateProducts(newProducts: self._products)
    }
}
