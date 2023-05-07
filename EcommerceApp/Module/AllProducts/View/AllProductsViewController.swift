//

//  AllProductsViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 02/05/23.
//

import UIKit
import SDWebImage

class AllProductsViewController: UIViewController {

    @IBOutlet weak var allProductsCollectionView: UICollectionView!
    
    private var products: Products?
    var viewModel: AllProductsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        allProductsCollectionView.delegate = self
        allProductsCollectionView.dataSource = self
        allProductsCollectionView.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionCell.identifier)
        
        self.viewModel = AllProductsViewModel.init(apiServiceProtocol: APIService())
        self.viewModel?.allProductsDataBinding = { allProductsData in
            if let allProductsData = allProductsData {
                self.products = allProductsData
            }
            DispatchQueue.main.async {
                self.allProductsCollectionView.reloadData()
            }
        }
    }
}

extension AllProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = products?.products.count ?? 0
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = allProductsCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        cell.setupProductCollectionCellUI()
        guard let allProductsDataItem = products?.products[indexPath.item] else { return UICollectionViewCell() }
        let transformer = SDImageResizingTransformer(size: CGSize(width: 156, height: 260), scaleMode: .aspectFit)
//        cell.productImage.sd_setImage(with: URL(string: allProductsDataItem.images[0] ?? ""), placeholderImage: nil, context: [.imageTransformer: transformer])
//        print("LOG")
//        print(allProductsDataItem.title)
//        cell.productNameLabel.text = allProductsDataItem.title
        cell.setupProductCollectionCellUI()
        cell.setupProductCollectionCellData(product: allProductsDataItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 2.3, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = products?.products[indexPath.item].id else { return }
        showDetailProduct(id: selectedItem)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    
}
