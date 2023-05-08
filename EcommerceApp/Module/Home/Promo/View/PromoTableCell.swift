//
//  PromoCell.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

class PromoTableCell: UITableViewCell {
    
    @IBOutlet weak var promoCollectionView: UICollectionView!
    @IBOutlet weak var promoPageControl: UIPageControl!
    
    weak var pageControl: UIPageControl?
    
    static let identifier = "promoTableCell"
    
    var promosData: Promos?
    var promoViewModel: PromoViewModelProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupPromoTableCellUI()
    }
    
    fileprivate func callAPI() {
        promoViewModel?.promoDataBinding = { promos in
            if let promos = promos {
                self.promosData = promos
                DispatchQueue.main.async() { [weak self] in
                    guard let `self` = self else { return }
                    self.promoCollectionView.reloadData()
                    self.promoPageControl.numberOfPages = self.promosData?.count ?? 0
                    self.promoCollectionView.reloadData()
                }
            }
        }
    }
    
    func setupPromoTableCellUI() {
        selectionStyle = .none
        promoPageControl.currentPage = 0
        
        promoCollectionView.register(UINib(nibName: "PromoCollectionCell", bundle: nil), forCellWithReuseIdentifier: PromoCollectionCell.identifier)
        promoCollectionView.showsHorizontalScrollIndicator = false
        promoCollectionView.dataSource = self
        
        promoViewModel = PromoViewModel(apiServiceProtocol: APIService())
        callAPI()
    }
}

extension PromoTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = promoCollectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionCell.identifier, for: indexPath) as? PromoCollectionCell else { return UICollectionViewCell()}
        guard let data = promosData?[indexPath.row] else { return UICollectionViewCell() }
        cell.setupPromoCollectionCellUI(data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promosData?.count ?? 0
    }
}

