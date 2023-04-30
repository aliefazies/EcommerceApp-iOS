//
//  FeaturedProductTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class FeaturedProductTableCell: UITableViewCell {
    
    static let identifier = "featuredProductTableCell"
    
    var productData: Products?
    var productViewModel: FeaturedProductViewModelProtocol?

    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func callAPI() {
        productViewModel?.featuredProductDataBinding = { product in
            if let product = product {
                self.productData = product
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.featuredProductCollectionView.reloadData()
        }
    }
    
    func setupFeaturedProductTableCellUI() {
        featuredProductCollectionView.delegate = self
        featuredProductCollectionView.dataSource = self
        featuredProductCollectionView.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionCell.identifier)
        
        productViewModel = FeaturedProductViewModel(apiServiceProtocol: APIService())
        callAPI()
    }
    
}

extension FeaturedProductTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = featuredProductCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        if let productDataItem = productData?.randomElement() {
            cell.setupProductCollectionCellUI()
            cell.setupProductCollectionCellData(product: productDataItem)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
