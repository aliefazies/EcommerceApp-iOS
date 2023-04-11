//
//  ProductStoreTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 11/04/23.
//

import UIKit

class ProductStoreTableCell: UITableViewCell {
    
    @IBOutlet weak var productStoreBgView: UIView!
    @IBOutlet weak var productStoreImage: UIImageView!
    @IBOutlet weak var productStoreStackView: UIStackView!
    @IBOutlet weak var productStoreNameLabel: UILabel!
    @IBOutlet weak var productStoreTypeLabel: UILabel!
    @IBOutlet weak var productStoreChevronRightButton: UIButton!
    
    static let identifier = "productStoreTableCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupProductStoreTableCellUI() {
        productStoreImage.image = UIImage(named: "product2")
        productStoreNameLabel.text = "Azies Store"
        productStoreTypeLabel.text = "Official Store"
    }
}
