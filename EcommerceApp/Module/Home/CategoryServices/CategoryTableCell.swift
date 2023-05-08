//
//  CategoryTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

enum ItemCategoryService: String, CaseIterable {
    case billTopUp = "Bills & Top-Ups"
    case travel = "Travel"
    case electricMoney = "Electric Money"
    case invest = "Invest"
    case officialStore = "Official Store"
    case payLater = "Pay Later"
    case games = "Games"
    case localPride = "Local Pride"
    case freeDelivery = "Free Delivery"
    case discount = "Discount"
    case foods = "Food"
    case cod = "Cash On Delivery"
    case superMarket = "Supermarket"
    case mall = "Mall"
    case liveProduct = "Live Product"
    case freeVouchers = "Free Vouchers"
    case electornic = "Electronic"
    case momAndKids = "Mom & Kids"
    case sports = "Sports"
    case phoneAndTablets = "Phones & Tablets"
    case promoNearby = "Promo Nearby"
    case donate = "Donate"
    
}

class CategoryTableCell: UITableViewCell {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    static let identifier = "categoryTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCategoryTableCellUI() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
}

extension CategoryTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as? CategoryCollectionCell else { return UICollectionViewCell() }
        
        cell.setupCategoryServicesUI(data: ItemCategoryService.allCases[indexPath.item].rawValue)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ItemCategoryService.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: categoryCollectionView.frame.size.width / 5.5, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 8, bottom: 0, right: 0)
    }
}
