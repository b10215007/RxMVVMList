//
//  ListViewController.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/6.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit
import RxSwift

class ListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    var viewModel: ListViewModel = {
        return ListViewModel()
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(ListUserTableViewCell.self,
                           forCellReuseIdentifier: ListUserTableViewCell.cellIdentifier)

        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupBinding()
        viewModel.getUsers()
    }
    
    private func configureView() {
        self.view.addSubviews([tableView])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupBinding() {
        self.viewModel
            .users
            .take(100)
            .bind(to: tableView.rx.items) { (tableView, row, model) in
                let cell = tableView.dequeueReusableCell(withIdentifier: ListUserTableViewCell.cellIdentifier, for: IndexPath(row: row, section: 0)) as! ListUserTableViewCell
                
                cell.setup(model)
                return cell
        }.disposed(by: disposeBag)
        
        self.tableView.rx
            .modelSelected(ListUserModel.self)
            .subscribeOn(MainScheduler.instance)
            .subscribe(onNext: {
                let vc = ListDetailViewController(model: $0)
                self.present(vc, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}
