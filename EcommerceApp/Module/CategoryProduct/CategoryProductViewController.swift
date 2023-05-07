//
//  CategoryProductViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/05/23.
//

import UIKit

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
    case womenWatches = "Women Watches"
    case womenJewellery = "Women Jewellery"
    case sunglasses = "Sunglasses"
    case automotive = "Automotive"
    case motorcycle = "Motorcycle"
    case lighting = "Lighting"
    
}

class CategoryProductViewController: UIViewController {

    @IBOutlet weak var categoryProductCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        categoryProductCollectionView.register(UINib(nibName: "CategoryProductCollectionViewCell", bundle: nil ), forCellWithReuseIdentifier: CategoryProductCollectionViewCell.identifier )
        categoryProductCollectionView.dataSource = self
        categoryProductCollectionView.delegate = self
    }

}

extension CategoryProductViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CategoryProductDummy.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryProductCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryProductCollectionViewCell.identifier, for: indexPath) as? CategoryProductCollectionViewCell else { return UICollectionViewCell() }
        cell.categoryProductImageView.image = UIImage(named: "cart")
        cell.categoryProductLabel.text = CategoryProductDummy.allCases[indexPath.item].rawValue
        cell.categoryProductLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryProductCollectionView.frame.size.width / 3.6, height: UIScreen.main.bounds.height / 5.6)
    }
    
}
