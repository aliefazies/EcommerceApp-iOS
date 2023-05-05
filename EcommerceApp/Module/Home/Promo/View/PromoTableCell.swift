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
    
    var promosData: Promos?
    var promoViewModel: PromoViewModelProtocol?

    @IBOutlet weak var promoCollectionView: DynamicHeightCollectionView!
    @IBOutlet weak var promoPageControl: UIPageControl!
   
    weak var pageControl: UIPageControl?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    fileprivate func callAPI() {
        promoViewModel?.promoDataBinding = { promos in
            if let promos = promos {
                self.promosData = promos
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [weak self] in
            self?.promoCollectionView.reloadData()
            self?.promoPageControl.numberOfPages = self?.promosData?.count ?? 0
        }
    }
    
    func setupPromoTableCellUI() {
        selectionStyle = .none
        promoCollectionView.register(UINib(nibName: "PromoCollectionCell", bundle: nil), forCellWithReuseIdentifier: PromoCollectionCell.identifier)
        
        promoCollectionView.showsHorizontalScrollIndicator = false
//        promoCollectionView.delegate = self
        promoCollectionView.dataSource = self
        
        promoViewModel = PromoViewModel(apiServiceProtocol: APIService())
        callAPI()
        DispatchQueue.main.async { [weak self] in
            self?.promoCollectionView.reloadData()
        }
    }
}

extension PromoTableCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = promoCollectionView.dequeueReusableCell(withReuseIdentifier: PromoCollectionCell.identifier, for: indexPath) as? PromoCollectionCell else { return UICollectionViewCell()}
        cell.configurePromoImage(promoData: promosData?[indexPath.row] ?? Promo(idPromo: 0, fileName: "", fileURL: ""))
        cell.promoImage.layer.cornerRadius = 8
        cell.promoImage.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return promosData?.count ?? 0
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: cellSize.cellWidth.rawValue, height: cellSize.cellHeight.rawValue)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
}

