//
//  DetailViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 10/04/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: DynamicHeightTableView!
    
    fileprivate func setupDetailTableView() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(UINib(nibName: "ProductImageTableCell", bundle: nil), forCellReuseIdentifier: ProductImageTableCell.identifier)
        detailTableView.register(UINib(nibName: "ProductStoreTableCell", bundle: nil), forCellReuseIdentifier: ProductStoreTableCell.identifier)
        detailTableView.register(UINib(nibName: "ProductDescriptionTableCell", bundle: nil), forCellReuseIdentifier: ProductDescriptionTableCell.identifier)
        detailTableView.register(UINib(nibName: "ProductReviewTableCell", bundle: nil), forCellReuseIdentifier: ProductReviewTableCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDetailTableView()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: ProductImageTableCell.identifier) as? ProductImageTableCell else { return UITableViewCell() }
            
            cell.setupProductImageTableCellUI()
            return cell
        case 1:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: ProductStoreTableCell.identifier) as? ProductStoreTableCell else { return UITableViewCell() }
            
            cell.setupProductStoreTableCellUI()
            return cell
        case 2:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: ProductDescriptionTableCell.identifier) as? ProductDescriptionTableCell else { return UITableViewCell() }
            
            cell.setupProductDescriptionTableCellUI()
            return cell
        case 3:
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: ProductReviewTableCell.identifier) as? ProductReviewTableCell else { return UITableViewCell() }
            cell.setupProductReviewTableCellUI()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
}

extension UIViewController {
    func showDetailProduct() {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
