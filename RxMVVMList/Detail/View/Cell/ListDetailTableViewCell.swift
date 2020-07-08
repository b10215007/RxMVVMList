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
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        textView.dataDetectorTypes = .link
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    func setup(icon: UIImage, text: String) {
        iconImageView.image = icon
        textView.text = text
//        if text.find
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        self.addSubviews([iconImageView, textView])
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            
            textView.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 8),
            textView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
