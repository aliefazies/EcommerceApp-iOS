//
//  ProductReviewTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 11/04/23.
//

import UIKit

class ProductReviewTableCell: UITableViewCell {
    
    static let identifier = "productReviewTableCell"

    @IBOutlet weak var productReviewBgView: UIView!
    @IBOutlet weak var productReviewTitleLabel: UILabel!
    @IBOutlet weak var productReviewCountLabel: UILabel!
    @IBOutlet weak var productReviewTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productReviewTableView.estimatedRowHeight = 120
        productReviewTableView.rowHeight = UITableView.automaticDimension
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupProductReviewTableCellUI() {
        productReviewTitleLabel.text = "Reviews"
        productReviewCountLabel.text = "6"
        productReviewTableView.delegate = self
        productReviewTableView.dataSource = self
        productReviewTableView.register(UINib(nibName: "ReviewTableCell", bundle: nil), forCellReuseIdentifier: ReviewTableCell.identifier)
    }
    
}

extension ProductReviewTableCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productReviewTableView.dequeueReusableCell(withIdentifier: ReviewTableCell.identifier) as? ReviewTableCell else { return UITableViewCell() }
        cell.setupReviewTableCellUI()
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}
