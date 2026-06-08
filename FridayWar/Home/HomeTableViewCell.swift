//
//  HomeTableViewCell.swift
//  4Twos
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    let gameLabelView = UILabel()
    let iconImageView = UIImageView()
    private let separatorView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        gameLabelView.font = UIFont(name: "ArialRoundedMTBold", size: 19) ?? .boldSystemFont(ofSize: 19)
        gameLabelView.translatesAutoresizingMaskIntoConstraints = false

        separatorView.backgroundColor = .systemGray6
        separatorView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(iconImageView)
        contentView.addSubview(gameLabelView)
        contentView.addSubview(separatorView)

        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 88),
            iconImageView.heightAnchor.constraint(equalToConstant: 88),

            gameLabelView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 20),
            gameLabelView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            gameLabelView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

}
