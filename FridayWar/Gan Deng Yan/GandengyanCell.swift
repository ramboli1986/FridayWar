//
//  GandengyanCell.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class GandengyanCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var record: Record? {
        didSet {
            scoreLabel.text = "+" + String((record?.winnerScore ?? 0))
            timeLabel.text = record?.time
            avatarImageView.image = UIImage(named: record?.winner ?? "")
            nameLabel.text = record?.winner
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
