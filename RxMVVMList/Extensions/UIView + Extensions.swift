//
//  UIView + Extensions.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/7.
//  Copyright © 2020 25sprout. All rights reserved.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}
