//
//  ListModel.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/6.
//  Copyright © 2020 25sprout. All rights reserved.
//

import Foundation

struct ListModel: Decodable {
    let id: Int
    let userName: String
    let title: String
    let avatarString: String
}
