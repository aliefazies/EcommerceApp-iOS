//
//  ProductPerCategoryViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 07/05/23.
//

import UIKit

class ProductPerCategoryViewController: UIViewController {

    @IBOutlet weak var productPerCategoryCollectionView: UICollectionView!
//    @IBOutlet weak var urlLabel: UILabel!
    
    var categories: String = ""
    var productsData: Products?
    
    var viewModel: ProductPerCategoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         Do any additional setup after loading the view.
        productPerCategoryCollectionView.delegate = self
        productPerCategoryCollectionView.dataSource = self
        productPerCategoryCollectionView.register(UINib(nibName: "ProductCollectionCell", bundle: nil), forCellWithReuseIdentifier: ProductCollectionCell.identifier)
        self.viewModel = ProductPerCategoryViewModel(category: categories, apiServiceProtocol: APIService())
        
        self.viewModel?.ProductPerCategoryDataBinding = { productPerCategoryData in
            if let productPerCategoryData = productPerCategoryData {
                self.productsData = productPerCategoryData
            }
            DispatchQueue.main.async {
                self.productPerCategoryCollectionView.reloadData()
            }
        }
    }
}

extension ProductPerCategoryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsData?.products.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = productPerCategoryCollectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionCell.identifier, for: indexPath) as? ProductCollectionCell else { return UICollectionViewCell() }
        guard let productPerCategoryItem = productsData?.products[indexPath.item] else { return UICollectionViewCell() }
        cell.setupProductCollectionCellUI()
        cell.setupProductCollectionCellData(product: productPerCategoryItem)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width / 2.3, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedItem = productsData?.products[indexPath.item].id else { return }
        showDetailProduct(id: selectedItem)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}

//extension UIViewController {
//    func showProductPerCategoryViewController(categories: [String]) {
//        let vc = ProductPerCategoryViewController()
//        vc.categories = categories
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//}
