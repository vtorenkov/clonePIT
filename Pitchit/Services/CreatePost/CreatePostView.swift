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

public enum CreatePostView: TargetType {
    
    case createPost(post: ItemModel)
  
    public var baseURL: URL {
        return URL(string: "http://ec2-52-91-253-224.compute-1.amazonaws.com")!
    }
    
    public var path: String {
        switch self {
        case .createPost:
            return "/offer/create"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .createPost:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .createPost(let post):
            return .requestParameters(parameters: ["title":post.title,
                                                   "description":post.desc,
                                                   "categoryId":post.type.rawValue,
                                                   "address":"post.address",
                                                   "longitude":post.placeCoodinate?.longitude,
                                                   "latitude":post.placeCoodinate?.latitude,
                                                   "price":post.price,
                                                   "productStatus":post.conditionType.rawValue,
                                                   "videoFile":post.videoUrl,
                                                   "thumbNail":"post.thumbnail"
                                                  // "attachments": nil  //optionals
                ], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .createPost:
            let username = UserManager.getCurrentUserObject().email
            let password = UserManager.getPassword()
            let loginString = String(format: "%@:%@", username, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            return ["Authorization":"Basic \(base64LoginString)"]
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
