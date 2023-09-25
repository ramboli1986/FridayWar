//
//  DetailScoreCell.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class DetailScoreCell: UITableViewCell {

    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
