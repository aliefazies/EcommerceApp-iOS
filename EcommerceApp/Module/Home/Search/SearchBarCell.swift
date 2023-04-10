//
//  SearchBarCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class SearchBarCell: UITableViewCell {
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var searchBarLabel: UITextField!
    @IBOutlet weak var searchBarIcon: UIImageView!
    
    static let identifier = "searchCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
