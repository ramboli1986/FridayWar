//
//  DetailScoreVC.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class DetailScoreVC: UITableViewController {
    
    let record: Record
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Detail"
        navigationController?.navigationBar.tintColor = .black
        tableView.register(UINib(nibName: "DetailScoreCell", bundle: nil), forCellReuseIdentifier: "DetailScoreCell")
        tableView.rowHeight = 56
        tableView.separatorStyle = .none
    }
    
    init(record: Record) {
        self.record = record
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return record.others.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailScoreCell", for: indexPath) as! DetailScoreCell
        if indexPath.row == 0 {
            cell.badgeView.isHidden = false
            cell.avatarImageView.image = UIImage(named: record.winner)
            cell.nameLabel.text = record.winner
            
        } else {
            cell.badgeView.isHidden = true
            let otherRecord = record.others[indexPath.row - 1]
            cell.avatarImageView.image = UIImage(named: otherRecord.name)
            cell.nameLabel.text = otherRecord.name
            cell.scoreLabel.text = "-" + String(otherRecord.score)
        }
        
        cell.rankLabel.text = String(indexPath.row + 1)
        
        return cell
    }
}
