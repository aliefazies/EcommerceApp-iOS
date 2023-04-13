//
//  PromoCollectionCell.swift
//  EcommerceAppj
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import SDWebImage

class PromoCollectionCell: UICollectionViewCell {
    
    static let identifier = "promoCollectionCell"
    
    @IBOutlet weak var promoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configurePromoImage(promoData: Promo) {
        let transformer = SDImageResizingTransformer(size: CGSize(width: 315, height: 150), scaleMode: .fill)
        promoImage.sd_setImage(with: URL(string:promoData.fileURL), placeholderImage: nil, context: [.imageTransformer: transformer])
    }
}
