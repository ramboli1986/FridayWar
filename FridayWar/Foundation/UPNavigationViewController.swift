//
//  UPNavigationViewController.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class UPNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = .white
        navAppearance.shadowColor = .clear
        navigationBar.standardAppearance = navAppearance
        navigationBar.scrollEdgeAppearance = navAppearance
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
