//
//  CreateDataCell.swift
//  FridayWar
//
//  Created by bo LI on 9/24/23.
//

import UIKit

class CreateDataCell: UITableViewCell {

    let avatarImageView = UIImageView()
    let nameLabel = UILabel()
    let inputTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.layer.cornerRadius = 8
        avatarImageView.layer.masksToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        nameLabel.font = .systemFont(ofSize: 16, weight: .medium)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        inputTextField.borderStyle = .roundedRect
        inputTextField.placeholder = "扣分"
        inputTextField.textAlignment = .center
        inputTextField.font = .systemFont(ofSize: 16)
        inputTextField.keyboardType = .numberPad
        inputTextField.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(inputTextField)

        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 36),
            avatarImageView.heightAnchor.constraint(equalToConstant: 36),

            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: inputTextField.leadingAnchor, constant: -12),

            inputTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            inputTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            inputTextField.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
    
}
