//
//  ListViewModel.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/6.
//  Copyright © 2020 25sprout. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa

enum UserRouter {
    case user(name: String)
    case users
}

extension UserRouter: RouterType {
    var baseURL: String {
        return Network.baseURL
    }
    
    var path: String {
        switch self {
        case let .user(name):
            return "/users/\(name)"
        case .users:
            return "/users"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var param: [String : Any]? {
        return nil
    }
    
    
}

class ListViewModel {
    
    let service = NetworkManager<UserRouter>()
    
    var users = PublisheRelay<[ListModel]>()
    
    func getUsers() {
        
    }
}
