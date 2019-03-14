//
//  ClientManager.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya

struct LoginManager: LoginClient {
    
    var provider = MoyaProvider<Login>()
    
    func registerUser(regModel: RegisterModel, completion: @escaping(Result)) {
        provider.request(.register(regModel: regModel)) { (result) in
            switch result {
            case let .success(response):
                do{
//                    let weather = try response.map(Weather.self)
                    completion(response.description)
                } catch let error{
//                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                completion(error.localizedDescription)
            }
        }
    }
}
