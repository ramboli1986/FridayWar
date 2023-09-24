//
//  HomeTabBarController.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
        
        delegate = self
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    func setupTabbar() {
        
        let nvHome = UPNavigationViewController(rootViewController: HomeViewController())
        
        let nvFriends = UPNavigationViewController(rootViewController: FriendsViewController())
        
        viewControllers = [nvHome, nvFriends]
        
        guard let items = tabBar.items else {return}
        tabBar.tintColor = .black
        let images = ["house", "person.2"]
        
        for (index, tabBarItem) in items.enumerated() {
            tabBarItem.image = UIImage(systemName: images[index], withConfiguration: UIImage.SymbolConfiguration(pointSize: 0, weight: .bold, scale: .large))
        }
    }

}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if tabBarController.currentUser == nil, viewController == tabBarController.viewControllers?[3] {
//            launchLoginVC()
//            return false
//        }
        return true
    }
}
