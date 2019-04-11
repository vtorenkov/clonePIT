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

public enum UserView: TargetType {
    case getUserProfile(userId: String)
    case userUpdateProfile(user: UserProfile)
    
    public var baseURL: URL {
        return URL(string: "http://ec2-52-91-253-224.compute-1.amazonaws.com")!
    }
    
    public var path: String {
        switch self {
        case .getUserProfile:
            return "/user/getuserprofile"
        case .userUpdateProfile:
            return "/user/updateprofile"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getUserProfile:
            return .get
        case .userUpdateProfile:
            return .post
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getUserProfile(let userId):
            return .requestParameters(parameters: ["id":userId], encoding: URLEncoding.default)
        case .userUpdateProfile(let user):
            
            let urlParameters = ["firstName": user.firstName,
                                 "lastName": user.lastName,
                                 "mobileNo": user.mobileNo ?? "",
                                 "facebookConnected": false,
                                 "creditCardVerified": false,
                                 "identityType": "passport",
                                 "indentityDoc": "passport",
                                 "identityVerified": true] as [String : Any]
            
            if let data = user.editedImage {
                let thumb = MultipartFormData(provider: .data(data), name: "image", fileName: "image.png", mimeType: "image/png")
                var formData = [thumb]
                for (key, value) in urlParameters {
                    formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key))
                }
                return .uploadMultipart(formData)
            } else {
                return .requestParameters(parameters: urlParameters, encoding: URLEncoding.default)
            }
        }
    }
    
    public var headers: [String : String]? {
        switch self {
        case .getUserProfile, .userUpdateProfile:
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
