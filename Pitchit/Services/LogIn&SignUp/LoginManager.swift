//
//  ClientManager.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya
import SKActivityIndicatorView

struct LoginManager: LoginClient {
   
    let provider = MoyaProvider<Login>(plugins: [NetworkActivityPlugin { type,_  in
        switch type {
        case .began : SKActivityIndicator.show("Loading...")
        case .ended : SKActivityIndicator.dismiss()
        }
        }])

    func loginUser(email: String, password: String, completion: @escaping (ResultLogin)) {
        provider.request(.login(email: email, password: password)) { (result) in
            switch result {
            case let .success(response):
                do{
                    let registerModel = try response.map(RegisterModel.self)
                    registerModel.passWord = password
                    completion(registerModel, response.description)
                } catch let error{
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                completion(nil, self.parseErrorMessage(error: error))
            }
        }
    }

    func registerUser(regModel: RegisterModel, completion: @escaping(Result)) {
        provider.request(.register(regModel: regModel)) { (result) in
            switch result {
            case let .success(response):
                do{
                    completion(true, response.description)
                } catch let error{
                    completion(false, error.localizedDescription)
                }
            case let .failure(error):
                completion(false, self.parseErrorMessage(error: error))
            }
        }
    }
    
    func registerBusinessUser(regModel: RegisterModel, completion: @escaping(Result)) {
        provider.request(.registerBusiness(regModel: regModel)) { (result) in
            switch result {
            case let .success(response):
                do{
                    completion(true, response.description)
                } catch let error{
                    completion(false, error.localizedDescription)
                }
            case let .failure(error):
                completion(false, self.parseErrorMessage(error: error))
            }
        }
    }
    
    func parseErrorMessage(error: MoyaError) -> String {
        do {
            if let body = try error.response?.mapJSON() as? NSDictionary, let mess = body.value(forKey: "message") as? String {
                return mess
            }
        } catch {
            return error.localizedDescription
        }
        return "Error, something happens"
    }
}
