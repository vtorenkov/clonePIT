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

public enum MainView: TargetType {
    case getPosts()
   
    public var baseURL: URL {
        return URL(string: "http://ec2-52-91-253-224.compute-1.amazonaws.com")!
    }
    
    public var path: String {
        switch self {
        case .getPosts:
            return "/offer/get"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getPosts:
            return .requestParameters(parameters: ["page":1, "limit":20], encoding: URLEncoding.default)
        }
    }
  
    public var headers: [String : String]? {
        switch self {
        case .getPosts:
            let username = UserManager.getCurrentUserObject().email
            let password = UserManager.getPassword()
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
