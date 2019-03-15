//
//  DarkSky.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/25/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya
import Alamofire

public enum Login: TargetType {
    case register(regModel: RegisterModel)
    case login(email: String, password: String)
    
    public var baseURL: URL {
        return URL(string: "http://ec2-34-238-119-69.compute-1.amazonaws.com")!
    }
    
    public var path: String {
        switch self {
        case .register:
            return "/user/register"
        case .login:
            return "/user/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .login:
            return .requestPlain
        case .register(let regModel):
            return .requestPlain
//            Parameters(parameters: ["email":regModel.email, "firstName":regModel.firstName, "lastName":regModel.lastName, "mobileNo":regModel.mobileNo, "password":regModel.password, "cpassword":regModel.cpassword], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .login(let email, let password):
            let username = email
            let password = password
            let loginString = String(format: "%@:%@", username, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            return ["Authorization":"Basic \(base64LoginString)"]
        default:
            return nil
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
