//
//  UserButtonTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class MenuButtonTableCell: UITableViewCell {
    
    static let identifier = "userButtonTableCell"

    @IBOutlet weak var userButtonBgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUserButtonTableCellUI() {
        selectionStyle = .none
        titleLabel.text = "My Orders"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = UIColor.black
        
        subtitleLabel.text = "View your orders"
        subtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        subtitleLabel.textColor = UIColor.systemGray
        
        userButtonBgView.layer.cornerRadius = 8
        userButtonBgView.layer.masksToBounds = true
        userButtonBgView.layer.borderColor = UIColor.lightGray.cgColor
        userButtonBgView.layer.borderWidth = 0.1
        
    }
    
}
