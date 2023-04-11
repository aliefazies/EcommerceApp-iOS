//
//  ProductDescriptionTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 11/04/23.
//

import UIKit

class ProductDescriptionTableCell: UITableViewCell {
    
    static let identifier = "productDescriptionTableCell"

    @IBOutlet weak var productDescriptionBgView: UIView!
    @IBOutlet weak var productDescriptionTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupProductDescriptionTableCellUI() {
        productDescriptionTitleLabel.text = "Description Product"
        productDescriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam rhoncus lorem sollicitudin mattis suscipit. Nulla lobortis magna massa, sit amet facilisis turpis sodales quis. Pellentesque auctor ac diam sit amet commodo. Nulla facilisi. Integer in augue ex. Maecenas sodales sollicitudin turpis volutpat imperdiet. Proin ultricies aliquet neque quis elementum. Cras."
    }
    
}
