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
    case getPosts(userId: String?)
    case getCategories()
    case getFavorites(userId: String?)
    case addToFavorites(offerId: String)
    case getPost(postId: String)
    case deletePost(postId: String)
    case updatePostSold(postId: String)

    public var baseURL: URL {
        return URL(string: "http://ec2-52-91-253-224.compute-1.amazonaws.com")!
    }
    
    public var path: String {
        switch self {
        case .getPost:
            return "/post/getpost"
        case .deletePost:
            return "/post/delete"
        case .updatePostSold:
            return "/post/updatetosold"
        case .getPosts:
            return "/post/get"
        case .getCategories:
            return "/category/get"
        case .getFavorites:
            return "/post/getfavorites"
        case .addToFavorites:
            return "/post/addtofavourite"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getPosts, .getCategories, .getFavorites, .addToFavorites, .getPost:
            return .get
        case .deletePost, .updatePostSold:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getPosts(let userId):
            if let id = userId {
                return .requestParameters(parameters: ["page":1, "limit":20, "userId": id], encoding: URLEncoding.default)
            } else {
                return .requestParameters(parameters: ["page":1, "limit":20], encoding: URLEncoding.default)
            }
        case .getCategories:
            return .requestParameters(parameters: ["page":1, "limit":20], encoding: URLEncoding.default)
        case .getFavorites(let userId):
            if let id = userId {
                return .requestParameters(parameters: ["page":1, "limit":20, "userId": id], encoding: URLEncoding.default)
            } else {
                return .requestParameters(parameters: ["page":1, "limit":20], encoding: URLEncoding.default)
            }
        case .addToFavorites(let offerId):
            return .requestParameters(parameters: ["offerId":offerId], encoding: URLEncoding.default)
        case .getPost(let postId):
            return .requestParameters(parameters: ["postId":postId], encoding: URLEncoding.default)
        case .deletePost(let postId):
            return .requestParameters(parameters: ["postId":postId], encoding: URLEncoding.default)
        case .updatePostSold(let postId):
            return .requestParameters(parameters: ["postId":postId], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getPosts, .getCategories, .getFavorites, .addToFavorites, .getPost, .deletePost, .updatePostSold:
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
