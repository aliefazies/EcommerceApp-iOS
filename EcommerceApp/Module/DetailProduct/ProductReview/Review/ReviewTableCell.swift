//
//  ReviewTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 11/04/23.
//

import UIKit

class ReviewTableCell: UITableViewCell {
    
    static let identifier = "reviewTableCell"
    

    @IBOutlet weak var reviewBgView: UIView!
    @IBOutlet weak var reviewProfileImage: UIImageView!
    @IBOutlet weak var reviewProfileNameLabel: UILabel!
    @IBOutlet weak var reviewCountLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var reviewDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupReviewTableCellUI() {
        reviewProfileImage.image = UIImage(named: "product3")
        reviewProfileNameLabel.text = "Azies"
        reviewCountLabel.text = "⭐️4"
        reviewDateLabel.text = "2 weeks ago"
        reviewDescriptionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vestibulum nunc lorem, tincidunt tempus nisi facilisis ut. Vestibulum sapien ligula, efficitur ac dapibus in, consectetur eu diam. Mauris sodales nisl mi. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum ut metus et felis dapibus ornare. Mauris a blandit orci. Praesent laoreet odio vel porta vestibulum. Vivamus sed lorem pretium."
    }
    
}
