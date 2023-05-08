//
//  CategoryProductViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/05/23.
//

import UIKit
import Foundation

enum CategoryProductDummy: String, CaseIterable {
    case smartphones = "Smartphones"
    case laptops = "Laptops"
    case fragrance = "Fragrances"
    case skincare = "Skincare"
    case groceries = "Groceries"
    case homeDecorations = "Home Decorations"
    case furniture = "Furniture"
    case tops = "Tops"
    case womenDresses = "Women Dresses"
    case womenShoes = "Women Shoes"
    case menShirts = "Men Shirts"
    case menSHoes = "Men Shoes"
    case menWatches = "Men Watches"
    case womenWatches = "Women Watches"
    case womenBags = "Women Bags"
    case womenJewellery = "Women Jewellery"
    case sunglasses = "Sunglasses"
    case automotive = "Automotive"
    case motorcycle = "Motorcycle"
    case lighting = "Lighting"
}

class CategoryProductViewController: UIViewController {

    @IBOutlet weak var categoryProductCollectionView: UICollectionView!
    
    let viewModel = CategoryProductViewModel()
    
    var categoriesData: [String] = []
    
    fileprivate func setupCategoryProductCollectionUI() {
        categoryProductCollectionView.register(UINib(nibName: "CategoryProductCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: CategoryProductCollectionViewCell.identifier )
        categoryProductCollectionView.dataSource = self
        categoryProductCollectionView.delegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCategoryProductCollectionUI()
        viewModel.fetchCategories { result in
            switch result {
            case .success(let category):
                DispatchQueue.main.async {
                    self.categoryProductCollectionView.reloadData()
                    self.categoriesData = category
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension CategoryProductViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryProductDummy.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryProductCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryProductCollectionViewCell.identifier, for: indexPath) as? CategoryProductCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCategoryProductUI(data: CategoryProductDummy.allCases[indexPath.item].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryProductCollectionView.frame.size.width / 3.6, height: UIScreen.main.bounds.height / 5.6)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showProductPerCategoryViewController(data: categoriesData[indexPath.item])
    }
}
