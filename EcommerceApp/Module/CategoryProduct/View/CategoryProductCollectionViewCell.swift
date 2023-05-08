//
//  CategoryProductCollectionViewCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/05/23.
//

import UIKit

class CategoryProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryProductImageView: UIImageView!
    @IBOutlet weak var categoryProductLabel: UILabel!

    static let identifier = "CategoryProductCollectionViewCell"
    
    func setupCategoryProductUI(data: String) {
        categoryProductImageView.image = UIImage(named: "cart")
        categoryProductLabel.text = data
        categoryProductLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
