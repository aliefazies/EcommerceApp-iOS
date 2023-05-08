//
//  HomeViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit

protocol HomeViewControllerDelegate {
    func navigateToDetail(id: Int)
}

enum HomeItemGroup: Int, CaseIterable {
    case wallet
    case promo
    case category
    case featuredProduct
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    weak var pageControl: UIPageControl?
    weak var promosCollectionView: UICollectionView?
    
    fileprivate func setupHomeTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.separatorStyle = .none
        
        homeTableView.register(UINib(nibName: "WalletTableViewCell", bundle: nil), forCellReuseIdentifier: WalletTableViewCell.identifier)
        homeTableView.register(UINib(nibName: "PromoTableCell", bundle: nil), forCellReuseIdentifier: PromoTableCell.identifier)
        homeTableView.register(UINib(nibName: "CategoryTableCell", bundle: nil), forCellReuseIdentifier: CategoryTableCell.identifier)
        homeTableView.register(UINib(nibName: "FeaturedProductTableCell", bundle: nil), forCellReuseIdentifier: FeaturedProductTableCell.identifier)
    }
    
    fileprivate func setupRightBarButtonItem() {
        let image1 = UIImage(systemName: "cart")
        let imageView1 = UIImageView(image: image1)
        imageView1.tintColor = .systemYellow
        imageView1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView1.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        let image2 = UIImage(systemName: "envelope")
        let imageView2 = UIImageView(image: image2)
        imageView2.tintColor = .systemYellow
        imageView2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        imageView2.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [imageView1, imageView2])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        
        let customView = UIView()
        customView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: customView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
        ])
        
        let rightBarButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    fileprivate func setupSearchBar() {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = false
        searchBar.delegate = self
    }
    
    fileprivate func setupNavigationBar() {
        setupSearchBar()
        setupRightBarButtonItem()
    }
    
    @objc func iconButtonTapped(_ sender: Any) {
        print("iconButtonTapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
        setupNavigationBar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
    
    @objc func showAllButtonTapped(_ sender: Any) {
        navigateToAllProducts()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableSections = HomeItemGroup(rawValue: indexPath.section)
        switch tableSections {
        case .wallet:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: WalletTableViewCell.identifier, for: indexPath) as? WalletTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            return cell
            
        case .promo:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: PromoTableCell.identifier, for: indexPath) as? PromoTableCell else { return UITableViewCell()}
            
            self.pageControl = cell.promoPageControl
            self.promosCollectionView = cell.promoCollectionView
            cell.setupPromoTableCellUI()
            cell.promoCollectionView.delegate = self
            return cell
            
        case .category:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: CategoryTableCell.identifier, for: indexPath) as? CategoryTableCell else { return UITableViewCell() }
            cell.setupCategoryTableCellUI()
            return cell
            
        case .featuredProduct:
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
        return HomeItemGroup.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension HomeViewController: HomeViewControllerDelegate {
    func navigateToDetail(id: Int) {
        showDetailProduct(id: id)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 160)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.promosCollectionView {
            let page = scrollView.contentOffset.x / scrollView.frame.width
            pageControl?.currentPage = Int(page)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
