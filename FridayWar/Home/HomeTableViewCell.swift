//
//  HomeTableViewCell.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var gameLabelView: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
