//
//  ListDetailViewController.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/6.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit
import RxSwift

class ListDetailViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(ListDetailTableViewCell.self,
                           forCellReuseIdentifier: ListDetailTableViewCell.cellIdentifier)

        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var viewModel: ListDetailViewModel
    init(model: ListUserModel){
        self.viewModel = ListDetailViewModel(model: model)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupBinding()
        self.viewModel.getDetail()
    }
    
    private func configureView() {
        self.view.backgroundColor = .white
        self.view.addSubviews([avatarImageView, nameLabel, descLabel, tableView])
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 24),
            avatarImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            nameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            descLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            descLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 24),
            descLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -24),
            
            tableView.topAnchor.constraint(equalTo: descLabel.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBinding() {
        self.viewModel
            .detail.bind {
                self.avatarImageView.sd_setImage(with: URL(string: $0.avatar_url),
                                                 placeholderImage: UIImage.imageWithColor(.black),
                                                 options: .continueInBackground,
                                                 completed: nil)
                self.nameLabel.text = $0.name
                self.descLabel.text = $0.bio ?? "-"
        }.disposed(by: disposeBag)
     
        self.viewModel.detail.map({
            return [$0.login, $0.location, $0.email, $0.blog, "Admin: \($0.site_admin)", "Company: \($0.company)"]
        }).bind(to: tableView.rx.items) { (tableView, row, model) in
                let cell = tableView.dequeueReusableCell(withIdentifier: ListDetailTableViewCell.cellIdentifier, for: IndexPath(row: row, section: 0)) as! ListDetailTableViewCell
            
            cell.setup(icon: UIImage.imageWithColor(.blue), text: model ?? "-")
                return cell
        }.disposed(by: disposeBag)
    }
}
