//
//  TabBar.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import FirebaseAuth

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        tabBar.backgroundColor = .systemBackground
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
//            createNavController(for: WishlistViewController(), title: NSLocalizedString("Wishlist", comment: ""), image: UIImage(systemName: "basket")!),
            createNavController(for: CategoryProductViewController(), title: "Category", image: UIImage(systemName: "square.grid.2x2.fill")!),
//            createNavController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person")!)
            setupProfileVCs()
        ]
    }
    
    func setupProfileVCs() -> UIViewController {
        var vc = UIViewController()
        if Auth.auth().currentUser != nil {
            vc = createNavController(for: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person")!)
        } else {
            vc = createNavController(for: RegisterViewController(), title: NSLocalizedString("Register", comment: ""), image: UIImage(systemName: "person")!)
        }
        return vc
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}
