//
//  DetailViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailProductRating: UILabel!
    @IBOutlet weak var detailProductPrice: UILabel!
    @IBOutlet weak var detailProductDescription: UILabel!
    @IBOutlet weak var detailProductNameLabel: UILabel!
    @IBOutlet weak var detailProductImage: UIImageView!
    
    var detailProductViewModel: DetailProductViewModel?
    
    var id: Int?
    var productData: Product?
    
    fileprivate func setupDetailProductUI() {
        detailProductPrice.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        detailProductNameLabel.font = UIFont.systemFont(ofSize: 16)
        detailProductRating.font = UIFont.systemFont(ofSize: 12, weight: .light)
        detailProductRating.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = id else { return }
        
        setupDetailProductUI()
        
        self.detailProductViewModel = DetailProductViewModel(id: id, apiServiceProtocol: APIService())
        detailProductViewModel?.detailProductDataBinding = { product in
            if let productDetailData = product {
                self.productData = productDetailData
                DispatchQueue.main.async {
                    self.detailProductImage.sd_setImage(with: URL(string: self.productData?.images[0] ?? ""))
                    
                    self.detailProductNameLabel.text = self.productData?.title
                    
                    self.detailProductDescription.text = self.productData?.description
                    
                    self.detailProductPrice.text = "$ \(self.productData?.price ?? 0)"
                    
                    self.detailProductRating.text = "\(self.productData?.rating ?? 0)"
                }
            }
            print(self.productData)
        }
        
    }
}

extension UIViewController {
    func showDetailProduct(id: Int) {
        let vc = DetailViewController()
        vc.id = id
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
