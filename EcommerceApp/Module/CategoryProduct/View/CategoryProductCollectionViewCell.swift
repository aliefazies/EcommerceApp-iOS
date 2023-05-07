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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
