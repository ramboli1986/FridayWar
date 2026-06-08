//
//  FriendsCell.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class FriendsCell: UITableViewCell {

    let nameLabel = UILabel()
    let avatarImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 56),
            avatarImageView.heightAnchor.constraint(equalToConstant: 56),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor)
        ])
    }
    
}
