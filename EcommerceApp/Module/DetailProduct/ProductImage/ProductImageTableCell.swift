//
//  ProductImageTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class ProductImageTableCell: UITableViewCell {
    
    static let identifier = "productImageTableCell"

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productReviewLabel: UILabel!
    @IBOutlet weak var productAvailableBgView: UIView!
    @IBOutlet weak var productAvailableLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupProductImageTableCellUI() {
        productImage.image = UIImage(named: "product1")
        productNameLabel.text = "Headset"
        productPriceLabel.text = "Rp1.000.000"
        productRatingLabel.text = "⭐️4.9"
        productReviewLabel.text = "85 reviews"
        productAvailableLabel.text = "Available: 20"
    }
}
