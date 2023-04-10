//
//  CategoryTableCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class CategoryTableCell: UITableViewCell {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    static let identifier = "categoryTableCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCategoryTableCellUI() {
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: CategoryCollectionCell.identifier)
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
}

extension CategoryTableCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionCell.identifier, for: indexPath) as? CategoryCollectionCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 76)
    }
}
