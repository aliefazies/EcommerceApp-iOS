//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

protocol HomeViewControllerDelegate {
    func navigateToDetail()
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    fileprivate func setupHomeTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        
        homeTableView.register(UINib(nibName: "SearchBarCell", bundle: nil), forCellReuseIdentifier: SearchBarCell.identifier)
        homeTableView.register(UINib(nibName: "PromoTableCell", bundle: nil), forCellReuseIdentifier: PromoTableCell.identifier)
        homeTableView.register(UINib(nibName: "CategoryTableCell", bundle: nil), forCellReuseIdentifier: CategoryTableCell.identifier)
        homeTableView.register(UINib(nibName: "FeaturedProductTableCell", bundle: nil), forCellReuseIdentifier: FeaturedProductTableCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
    }
    
    @objc func showAllButtonTapped(_ sender: Any) {
        let vc = AllProductsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PromoTableCell.identifier, for: indexPath) as? PromoTableCell else { return UITableViewCell()}
            cell.setupPromoTableCellUI()
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: CategoryTableCell.identifier, for: indexPath) as? CategoryTableCell else { return UITableViewCell() }
            cell.setupCategoryTableCellUI()
            return cell
        case 2:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: FeaturedProductTableCell.identifier, for: indexPath) as? FeaturedProductTableCell else { return UITableViewCell() }
            cell.setupFeaturedProductTableCellUI()
            cell.featuredProductDelegate = self
            cell.showAllLabel.addTarget(self, action: #selector(showAllButtonTapped(_:)), for: .touchUpInside)
            return cell
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
}

extension HomeViewController: HomeViewControllerDelegate {
    func navigateToDetail() {
        showDetailProduct()
    }
}
