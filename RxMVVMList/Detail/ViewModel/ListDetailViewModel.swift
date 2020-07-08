//
//  ListDetailViewModel.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/6.
//  Copyright © 2020 25sprout. All rights reserved.
//

import RxCocoa

final class ListDetailViewModel {
    
    let service = NetworkManager<UserRouter>()
    
    var detail = PublishRelay<ListDetailModel>()
    
    let model: ListUserModel
    
    init(model: ListUserModel) {
        self.model = model
    }
    
    func getDetail() {
        let completion: (ListDetailModel?, String?, Error?, Bool) -> Void = { data, msg, error, success in
            if let data = data, success {
                self.detail.accept(data)
            } else {
                print(error)
            }
        }
        
        service.requestData(.user(name: model.login), completion: completion)
    }
}
