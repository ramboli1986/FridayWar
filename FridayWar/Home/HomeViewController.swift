//
//  HomeViewController.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let names = ["干瞪眼", "阿瓦隆"]
    let imageNames = ["gandengyan", "avalon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 160
        
        self.navigationItem.title = "Table War!"
        
        DataManager.shared.updateDefaultFriendListIfNeeded()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.selectionStyle = .none
        cell.gameLabelView.text = names[indexPath.row]
        cell.iconImageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }

}
