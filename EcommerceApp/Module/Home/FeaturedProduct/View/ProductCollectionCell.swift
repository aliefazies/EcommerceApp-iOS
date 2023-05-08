//
//  ProductCollectionCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import SDWebImage

class ProductCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var productCollectionCellBgView: UIView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    static let identifier = "productCollectionCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupProductCollectionCellUI() {
        productNameLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        productNameLabel.textColor = UIColor(hexString: "#0C1A30")
        productNameLabel.numberOfLines = 2
        productPriceLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        productRatingLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        productCollectionCellBgView.layer.borderWidth = 0.5
        productCollectionCellBgView.layer.borderColor = UIColor.lightGray.cgColor
        productCollectionCellBgView.layer.cornerRadius = 8
        productCollectionCellBgView.layer.masksToBounds = true
        layer.masksToBounds = false
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0.5, height: 2)
        layer.shadowColor = UIColor.black.cgColor
    }
    
    func setupProductCollectionCellData(product: Product) {
        let transformer = SDImageResizingTransformer(size: CGSize(width: 130, height: 130), scaleMode: .aspectFit)
        productNameLabel.text = product.title
        productRatingLabel.text = "\(product.rating)"
        productPriceLabel.text = "$ \(product.price)"
        productImage.sd_setImage(with: URL(string: product.images[0] ), placeholderImage: nil, context: [.imageTransformer : transformer])
    }

}
