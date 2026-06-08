//
//  FriendsVC.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Friends"
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: "FriendsCell")
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
    }
    
    var onlines: [String] {
        return DataManager.shared.onlineFriends()
    }
    
    var offlines: [String] {
        return DataManager.shared.offlineFriends()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        }
        return "Offline"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return onlines.count
        }
        return offlines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as! FriendsCell
        let name = indexPath.section == 0 ? onlines[indexPath.row] : offlines[indexPath.row]
        cell.nameLabel.text = name
        cell.avatarImageView.image = AppResources.image(named: name)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 {
            // online list
            let name = onlines[indexPath.row]
            let action = UIContextualAction(style: .destructive, title: "下线") { action, view, completion in
                DataManager.shared.offline(name: name)
                tableView.reloadData()
                completion(true)
            }
            action.backgroundColor = .red
            return UISwipeActionsConfiguration(actions: [action])
        } else {
            // offline list
            let name = offlines[indexPath.row]
            let action = UIContextualAction(style: .destructive, title: "上线") { action, view, completion in
                DataManager.shared.online(name: name)
                tableView.reloadData()
                completion(true)
            }
            action.backgroundColor = UIColor(red: 250/255.0, green: 201/255.0, blue: 0/255.0, alpha: 1.0)
            return UISwipeActionsConfiguration(actions: [action])
            
        }
        
    }

}
