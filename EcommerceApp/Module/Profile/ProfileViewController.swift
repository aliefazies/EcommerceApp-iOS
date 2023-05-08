//
//  ProfileViewController.swift
//  EcommerceApp
//
//  Created by Alief Ahmad Azies on 06/04/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var userProfileTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userProfileTableView.delegate = self
        userProfileTableView.dataSource = self
        userProfileTableView.separatorStyle = .none
        
        userProfileTableView.register(UINib(nibName: "UserProfileTableCell", bundle: nil), forCellReuseIdentifier: UserProfileTableCell.identifier)
        userProfileTableView.register(UINib(nibName: "MenuButtonTableCell", bundle: nil), forCellReuseIdentifier: MenuButtonTableCell.identifier)
        userProfileTableView.register(UINib(nibName: "LogoutButtonTableCell", bundle: nil), forCellReuseIdentifier: LogoutButtonTableCell.identifier)
            
    }
    
    @objc func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("User hasn't logged out")
        }
        self.showLoginViewController()
        removeFromParent()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 4
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = userProfileTableView.dequeueReusableCell(withIdentifier: UserProfileTableCell.identifier) as? UserProfileTableCell else { return UITableViewCell() }
            
            cell.setupUserProfileTableCellUI()
            return cell
            
        case 1:
            guard let cell = userProfileTableView.dequeueReusableCell(withIdentifier: MenuButtonTableCell.identifier) as? MenuButtonTableCell else { return UITableViewCell() }
                    
            cell.setupUserButtonTableCellUI()
            return cell
        case 2:
            guard let cell = userProfileTableView.dequeueReusableCell(withIdentifier: LogoutButtonTableCell.identifier) as? LogoutButtonTableCell else { return UITableViewCell() }
            
            cell.setupLogoutButtonTableCellUI()
            cell.logoutButton.addTarget(self, action: #selector(logoutButtonTapped(_:)), for: .touchUpInside)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension UIViewController {
    func showProfileViewController() {
        let vc = ProfileViewController()
//        let scenes = UIApplication.shared.connectedScenes
//        let windowScene = scenes.first as! UIWindowScene
//        let window = windowScene.windows.first!
//        let navigationController = UINavigationController(rootViewController: vc)
        
//        window.rootViewController = navigationController
        self.navigationController?.tabBarItem.title = NSLocalizedString("Profile", comment: "")
        self.navigationController?.pushViewController(vc, animated: true)
        removeFromParent()
        tabBarItem.title = "profile"
        }
}
