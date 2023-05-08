//
//  WalletTableViewCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 05/05/23.
//

import UIKit

class WalletTableViewCell: UITableViewCell {
    
    @IBOutlet weak var walletPriceLabel: UILabel!
    @IBOutlet weak var walletPointsLabel: UILabel!
    @IBOutlet weak var walletVoucherLabel: UILabel!
    
    static let identifier = "WalletTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
