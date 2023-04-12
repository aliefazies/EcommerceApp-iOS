//
//  WishlistViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import SDWebImage

class WishlistViewController: UIViewController {
    
    var dataProductDummy = productProvider.all()
    
    @IBOutlet weak var wishlistCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWishlistCollectionView()
    }
    
    func setupWishlistCollectionView() {
        wishlistCollectionView.delegate = self
        wishlistCollectionView.dataSource = self
        wishlistCollectionView.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionCell.identifier)
    }
    
}

extension WishlistViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = wishlistCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        cell.setupProductCollectionCellUI()
        cell.productImage.sd_setImage(with: URL(string: dataProductDummy[indexPath.item].imageURL ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataProductDummy.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 260)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showDetailProduct()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}
