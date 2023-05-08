//
//  CategoryCollectionCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class CategoryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static let identifier = "categoryCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCategoryServicesUI(data: String) {
        categoryImage.image = UIImage(systemName: "cart.fill")
        categoryImage.tintColor = .systemYellow
        categoryLabel.text = data
        categoryLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        categoryLabel.numberOfLines = 0
        categoryLabel.textAlignment = .center
    }

}
