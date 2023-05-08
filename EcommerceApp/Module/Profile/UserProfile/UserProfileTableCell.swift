//
//  UserProfileTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit
import FirebaseAuth

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
        
        userProfileNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        if let user = Auth.auth().currentUser {
            let email = user.email
            userProfileEmailLabel.text = email
            let username = user.displayName
            userProfileNameLabel.text = username
        }else {
            print("Can't get user email")
        }
        userProfileEmailLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
    }
    
}
