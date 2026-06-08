//
//  GandengyanCell.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class GandengyanCell: UITableViewCell {
    
    let numberLabel = UILabel()
    let scoreLabel = UILabel()
    let timeLabel = UILabel()
    let nameLabel = UILabel()
    let avatarImageView = UIImageView()
    private let chevronImageView = UIImageView()
    
    var record: Record? {
        didSet {
            scoreLabel.text = "+" + String((record?.winnerScore ?? 0))
            timeLabel.text = record?.time
            avatarImageView.image = AppResources.image(named: record?.winner ?? "")
            nameLabel.text = record?.winner
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        numberLabel.font = .systemFont(ofSize: 17)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        scoreLabel.font = UIFont(name: "HoeflerText-Italic", size: 17) ?? .italicSystemFont(ofSize: 17)
        scoreLabel.textColor = UIColor(white: 1.0 / 3.0, alpha: 1)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false

        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .secondaryLabel
        timeLabel.translatesAutoresizingMaskIntoConstraints = false

        chevronImageView.image = UIImage(systemName: "chevron.right")
        chevronImageView.contentMode = .scaleAspectFit
        chevronImageView.tintColor = .secondaryLabel
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        scoreLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        timeLabel.setContentHuggingPriority(.required, for: .horizontal)
        chevronImageView.setContentHuggingPriority(.required, for: .horizontal)

        contentView.addSubview(numberLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(scoreLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(chevronImageView)

        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            avatarImageView.leadingAnchor.constraint(equalTo: numberLabel.trailingAnchor, constant: 32),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 28),
            avatarImageView.heightAnchor.constraint(equalToConstant: 28),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            scoreLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 16),
            scoreLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            scoreLabel.trailingAnchor.constraint(lessThanOrEqualTo: timeLabel.leadingAnchor, constant: -12),

            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: chevronImageView.leadingAnchor, constant: -12),

            chevronImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            chevronImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            chevronImageView.widthAnchor.constraint(equalToConstant: 18),
            chevronImageView.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
}
