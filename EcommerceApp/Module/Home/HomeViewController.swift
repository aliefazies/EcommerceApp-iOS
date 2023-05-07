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

enum HomeItemGroup: Int {
    case wallet
    case promo
    case category
    case featuredProduct
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchBarView: UIView!
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
    
    fileprivate func setupLeftBarButtonItem() {
        let imageView = UIImageView(image: UIImage(named: "cart"))
        let label = UILabel()
        label.text = "EcommerceApp"
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        stackView.spacing = 4
        imageView.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        let customView = UIView()
        customView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 32),
            imageView.heightAnchor.constraint(equalToConstant: 32),
            stackView.topAnchor.constraint(equalTo: customView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: customView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 36)
        ])
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.leftBarButtonItem = barButtonItem
        
        let deliveryImageView = UIImageView(image: UIImage(named: "delivery"))
        let chatImageView = UIImageView(image: UIImage(named: "chat"))
        
        let rightBarStackView = UIStackView(arrangedSubviews: [deliveryImageView, chatImageView])
        rightBarStackView.axis = .horizontal
        rightBarStackView.spacing = 12
        deliveryImageView.contentMode = .scaleAspectFit
        chatImageView.contentMode = .scaleAspectFit
        
        let rightBarCustomView = UIView()
        rightBarCustomView.addSubview(rightBarStackView)
        rightBarStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rightBarStackView.topAnchor.constraint(equalTo: rightBarCustomView.topAnchor),
            rightBarStackView.leadingAnchor.constraint(equalTo: rightBarCustomView.leadingAnchor),
            rightBarStackView.trailingAnchor.constraint(equalTo: rightBarCustomView.trailingAnchor),
            rightBarStackView.bottomAnchor.constraint(equalTo: rightBarCustomView.bottomAnchor),
            chatImageView.widthAnchor.constraint(equalToConstant: 28),
            chatImageView.heightAnchor.constraint(equalToConstant: 28),
            deliveryImageView.widthAnchor.constraint(equalToConstant: 28),
            deliveryImageView.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        let rightBarButtonItem = UIBarButtonItem(customView: rightBarCustomView)
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeTableView()
        setupLeftBarButtonItem()
        title = ""
        
        searchBarView.layer.borderColor = UIColor(hexString: "#FFB341").cgColor
        searchBarView.layer.borderWidth = 1
        searchBarView.layer.cornerRadius = 8
        searchBarView.layer.masksToBounds = true
    }
    
    @objc func showAllButtonTapped(_ sender: Any) {
        let vc = AllProductsViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
            cell.setupPromoTableCellUI()
            cell.promoPageControl.currentPage = 0
            
            self.pageControl = cell.promoPageControl
            cell.promoCollectionView.delegate = self
//            cell.promoCollectionView.dataSource = self
            self.promosCollectionView = cell.promoCollectionView
            
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
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch HomeItemGroup(rawValue: indexPath.section) {
        case .category:
            return 150
        default:
            return UITableView.automaticDimension
        }
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

