//
//  NetworkManager.swift
//  RxMVVMList
//
//  Created by Michael MA on 2020/7/7.
//  Copyright © 2020 25sprout. All rights reserved.
//

import Alamofire

protocol RouterType {
    var baseURL: String { get }
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    
    var encoding: ParameterEncoding { get }
    
    var param: [String: Any]? { get }
}

extension RouterType {
    var session: Session {
        return Session.default
    }
}

struct NetworkManager<Router: RouterType> {
    
    // MARK: - Network<APIRouter>().request(.method(parameter), completion)
    func requestData<D: Decodable>(_ router: Router, completion: @escaping (D?, String, Error?, Bool) -> Void) {
        let urlString = router.baseURL + router.path
        
        router.session.request(urlString,
                               method: router.method,
                               parameters: router.param,
                               encoding: router.encoding,
                               headers: []).validate().responseData { (response) in
                                
                                switch response.result {
                                case .success(let data):
                                    do {
                                        let jsonDecoder = JSONDecoder()
                                        let result = try jsonDecoder.decode(D.self, from: data)
                                        completion(result, "Suceess", nil, true)
                                    } catch let error {
                                        completion(nil, "Decoding Error", error, false)
                                    }
                                case .failure(let error):
                                        completion(nil, "Error Message", error, false)
                                }
        }
    }
}
