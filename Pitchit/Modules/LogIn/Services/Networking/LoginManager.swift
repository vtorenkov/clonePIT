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
    
    func loginUser(email: String, password: String, completion: @escaping (Result)) {
        provider.request(.login(email: email, password: password)) { (result) in
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
    
    
    let provider = MoyaProvider<Login>()
    
    /*(plugins: [CredentialsPlugin { _ -> URLCredential? in
        return URLCredential(user: "email@email.com", password: "password", persistence: .forSession)
        }
    ])*/

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
