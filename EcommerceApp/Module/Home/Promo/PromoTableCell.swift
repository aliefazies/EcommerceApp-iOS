//
//  PromoCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

enum cellSize: CGFloat {
    case cellWidth = 315
    case cellHeight = 150
}

class PromoTableCell: UITableViewCell {
    
    static let identifier = "promoTableCell"

    @IBOutlet weak var promoCollectionView: DynamicHeightCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPromoTableCellUI() {
        promoCollectionView.register(UINib(nibName: "PromoCollectionCell", bundle: nil), forCellWithReuseIdentifier: PromoCollectionCell.identifier)
        
        promoCollectionView.showsHorizontalScrollIndicator = false
        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
    }
}

extension PromoTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = promoCollectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionCell.identifier, for: indexPath) as? PromoCollectionCell else { return UICollectionViewCell()}
        
        cell.promoImage.image = UIImage(named: "banner\(indexPath.row + 1)")
        cell.layer.cornerRadius = 6
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellSize.cellWidth.rawValue, height: cellSize.cellHeight.rawValue)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

