//
//  TabBar.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import FirebaseAuth

class TabBar: UITabBarController {
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navController
    }
    
    fileprivate func setupProfileVCs() -> UIViewController {
        var vc = UIViewController()
        if Auth.auth().currentUser != nil {
            vc = createNavController(for: ProfileViewController(), title: "Profile", image: UIImage(systemName: "person")!)
        } else {
            vc = createNavController(for: RegisterViewController(), title: NSLocalizedString("Register", comment: ""), image: UIImage(systemName: "person")!)
        }
        return vc
    }
    
    fileprivate func setupVCs() {
        viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(systemName: "house")!),
            createNavController(for: CategoryProductViewController(), title: "Category", image: UIImage(systemName: "square.grid.2x2.fill")!),
            setupProfileVCs()
        ]
    }
    
    fileprivate func setupTabBarUI() {
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .systemYellow
        tabBar.backgroundColor = .systemBackground
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupTabBarUI()
        setupVCs()
    }
}
