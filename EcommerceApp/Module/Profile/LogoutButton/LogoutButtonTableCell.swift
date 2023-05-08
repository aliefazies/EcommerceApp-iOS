//
//  LogoutButtonTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class LogoutButtonTableCell: UITableViewCell {
    
    static let identifier = "logoutButtonTableCell"

    @IBOutlet weak var logoutButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupLogoutButtonTableCellUI() {
        selectionStyle = .none
        logoutButton.layer.cornerRadius = 4
        logoutButton.layer.masksToBounds = true
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
}
