//
//  Cell + Extensions.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/7.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell {
    static var cellIdentifier: String {
        return String(describing: self)
    }
}
