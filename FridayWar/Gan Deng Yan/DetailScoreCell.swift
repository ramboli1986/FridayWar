//
//  DetailScoreCell.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class DetailScoreCell: UITableViewCell {

    let badgeView = UIImageView()
    let scoreLabel = UILabel()
    let nameLabel = UILabel()
    let avatarImageView = UIImageView()
    let rankLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        rankLabel.font = UIFont(name: "Chalkduster", size: 17) ?? .systemFont(ofSize: 17)
        rankLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        badgeView.image = AppResources.image(named: "badge")
        badgeView.contentMode = .scaleAspectFit
        badgeView.translatesAutoresizingMaskIntoConstraints = false

        scoreLabel.font = .italicSystemFont(ofSize: 16)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        scoreLabel.setContentHuggingPriority(.required, for: .horizontal)

        contentView.addSubview(rankLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(badgeView)
        contentView.addSubview(scoreLabel)

        NSLayoutConstraint.activate([
            rankLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            rankLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            avatarImageView.leadingAnchor.constraint(equalTo: rankLabel.trailingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 36),
            avatarImageView.heightAnchor.constraint(equalToConstant: 36),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            badgeView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            badgeView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            badgeView.widthAnchor.constraint(equalToConstant: 20),
            badgeView.heightAnchor.constraint(equalToConstant: 18),

            scoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            badgeView.trailingAnchor.constraint(lessThanOrEqualTo: scoreLabel.leadingAnchor, constant: -12)
        ])
    }
    
}
