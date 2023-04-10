//
//  UserProfileTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class UserProfileTableCell: UITableViewCell {
    
    static let identifier = "userProfileTableCell"

    @IBOutlet weak var userProfileBgView: UIView!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    @IBOutlet weak var userProfileNameLabel: UILabel!
    
    @IBOutlet weak var userProfileEmailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupUserProfileTableCellUI() {
        userProfileBgView.layer.cornerRadius = 8
        userProfileBgView.layer.masksToBounds = true
//        userProfileBgView.layer.borderWidth = 1
//        userProfileBgView.layer.borderColor = UIColor(hex: "#DDDDDDFF")?.cgColor
//        layer.masksToBounds = false
//        layer.shadowOpacity = 0.3
//        layer.shadowRadius = 4
//        layer.shadowOffset = CGSize(width: 2, height: 2)
//        layer.shadowColor = UIColor.black.cgColor
        
        userProfileImage.layer.cornerRadius = 40
        userProfileImage.layer.masksToBounds = true
        userProfileImage.image = UIImage(named: "avatar")
        
        userProfileNameLabel.text = "Alief Azies"
        userProfileNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        userProfileEmailLabel.text = "alief.azies@gmail.com"
        userProfileEmailLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
}
