//
//  ProductCollectionCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell {
    
    static let identifier = "productCollectionCell"

    @IBOutlet weak var productCollectionCellBgView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productReviewCountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupProductCollectionCellUI() {
        productNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        productNameLabel.textColor = UIColor(hex: "#0C1A30FF")
        productNameLabel.text = "TMA-2 HD Wireless"
        productNameLabel.numberOfLines = 2
//        productCollectionCellBgView.backgroundColor = .systemPink
        
        
        
    }

}
