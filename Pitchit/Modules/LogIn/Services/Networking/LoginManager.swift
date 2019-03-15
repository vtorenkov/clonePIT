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
    func loginUser(email: String, password: String, completion: @escaping (ResultLogin)) {
        provider.request(.login(email: email, password: password)) { (result) in
            switch result {
            case let .success(response):
                do{
                    let registerModel = try response.map(RegisterModel.self)
                    completion(registerModel, response.description)
                } catch let error{
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    
    let provider = MoyaProvider<Login>()

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
