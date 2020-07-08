//
//  ListUserTableViewCell.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/7.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit
import SDWebImage

class ListUserTableViewCell: UITableViewCell {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 8
        label.backgroundColor = .systemBlue
        label.clipsToBounds = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(_ model: ListUserModel) {
        avatarImageView.sd_setImage(with: URL(string: model.avatar_url),
                                    placeholderImage: UIImage.imageWithColor(.black),
                                    options: .continueInBackground,
                                    completed: nil)
        nameLabel.text = model.login
        typeLabel.text = model.type
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        self.addSubviews([avatarImageView, nameLabel, typeLabel])
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            
            typeLabel.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            typeLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 8),
            typeLabel.widthAnchor.constraint(equalToConstant: 72)
        ])
    }
}
