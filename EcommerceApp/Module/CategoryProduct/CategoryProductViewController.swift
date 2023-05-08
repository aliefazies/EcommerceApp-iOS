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
    
//    func fetchCategories(completion: @escaping (Result<[String], Error>) -> Void) {
//        guard let url = URL(string: "https://dummyjson.com/products/categories") else {
//            return completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                completion(.failure(NSError(domain: "Invalid HTTP response", code: 0, userInfo: nil)))
//                return
//            }
//
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data returned", code: 0, userInfo: nil)))
//                return
//            }
//
//            do {
//                let categories = try JSONDecoder().decode([String].self, from: data)
//                completion(.success(categories))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
    
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
                    print(self.categoriesData)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
//        fetchCategories { result in
//            switch result {
//            case .success(let categories):
//                // Do something with the categories array
//                print(categories)
//            case .failure(let error):
//                // Handle the error
//                print(error.localizedDescription)
//            }
//        }
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
        let vc = ProductPerCategoryViewController()
        vc.categories = categoriesData[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
