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

    var featuredProductDelegate: HomeViewControllerDelegate?
    
    @IBOutlet weak var featuredProductCollectionView: UICollectionView!
    
    @IBOutlet weak var showAllLabel: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func callAPI() {
        productViewModel?.featuredProductDataBinding = { product in
            if let product = product {
                self.productData = product
                DispatchQueue.main.async {
                    self.featuredProductCollectionView.reloadData()
                }
            }
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
        if let productDataItem = productData?.products {
            cell.setupProductCollectionCellUI()
            cell.setupProductCollectionCellData(product: productDataItem[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 2.3, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = productData?.products[indexPath.item].id else { return }
        featuredProductDelegate?.navigateToDetail(id: selectedItem)
    }
}
