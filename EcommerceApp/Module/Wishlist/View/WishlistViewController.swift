//
//  WishlistViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import SDWebImage

class WishlistViewController:UIViewController {
    
    @IBOutlet weak var wishlistCollectionView: UICollectionView!
    
    private var products: Products?
    var viewModel: WishlistViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishlistCollectionView.delegate = self
        wishlistCollectionView.dataSource = self
        wishlistCollectionView.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionCell.identifier)
        
        
        self.viewModel = WishlistViewModel(apiServiceProtocol: APIService())
        self.viewModel?.wishlistDataBinding = { wishlistData in
            if let wishlistData = wishlistData {
                self.products = wishlistData
            }
            DispatchQueue.main.async {
                self.wishlistCollectionView.reloadData()
            }
        }
    }
    
}

extension WishlistViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = wishlistCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        cell.setupProductCollectionCellUI()
        guard let wishlistDataItem = products?[indexPath.item] else { return UICollectionViewCell() }
        let transformer = SDImageResizingTransformer(size: CGSize(width: 156, height: 260), scaleMode: .aspectFit)
        cell.productImage.sd_setImage(with: URL(string: wishlistDataItem.imageURL ?? ""), placeholderImage: nil, context: [.imageTransformer: transformer])
        cell.productNameLabel.text = wishlistDataItem.title
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = products?.count ?? 0
        return count
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
