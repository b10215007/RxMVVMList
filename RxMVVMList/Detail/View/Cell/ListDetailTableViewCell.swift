//
//  ListDetailTableViewCell.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/7.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit

class ListDetailTableViewCell: UITableViewCell {
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup(icon: UIImage, text: String) {
        iconImageView.image = icon
        label.text = text
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        self.addSubviews([iconImageView, label])
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            
            label.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
