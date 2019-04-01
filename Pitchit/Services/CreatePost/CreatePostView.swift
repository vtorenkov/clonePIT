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
            var movieData: Data?
            let urlString = "http://d3kodtkjrr2gfn.cloudfront.net/offersdata/92a66829-3edc-355f-b9a7-ee9da85b0ba6/1500468017VID_20170719_180951.mp4"
            //post.videoUrl
            if let url = URL(string: urlString) {
                do {
                    movieData = try Data(contentsOf: url, options: Data.ReadingOptions.alwaysMapped)
                } catch _ {
                    movieData = nil
                }
            }

            let urlParameters = ["title":"post.title",
                                 "description":"post.desc",
                                 "categoryId":post.type.rawValue,
                                 "address":"post.address",
                                 "longitude":post.placeCoodinate?.longitude ?? 0.0,
                                 "latitude":post.placeCoodinate?.latitude ?? 0.0,
                                 "price":4,//post.price,
                "productStatus":"post.conditionType.rawValue"] as [String : Any]
            
            
            let data = UIImagePNGRepresentation(UIImage(named: "albums")!)
            let movData = MultipartFormData(provider: .data(movieData!), name: "videoFile", fileName: "video.mov", mimeType: "video/mov")
            let thumb = MultipartFormData(provider: .data(data!), name: "thumbNail", fileName: "image.png", mimeType: "image/png")
            var formData = [movData, thumb]
            for (key, value) in urlParameters {
                formData.append(MultipartFormData(provider: .data("\(value)".data(using: .utf8)!), name: key))
            }
            
            return .uploadMultipart(formData)
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
