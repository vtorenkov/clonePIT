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
import AVFoundation

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
            let urlParameters = ["title":post.title,
                                 "description":post.desc,
                                 "categoryId":post.typeString,
                                 "address":post.place,
                                 "longitude":post.placeCoodinate?.longitude ?? 0.0,
                                 "latitude":post.placeCoodinate?.latitude ?? 0.0,
                                 "price":post.price,
                "productStatus":post.conditionType.rawValue] as [String : Any]
            
            
            let urlString = post.videoUrl
            let data = UIImagePNGRepresentation(getImage(from: urlString))
            let thumb = MultipartFormData(provider: .data(data!), name: "thumbNail", fileName: "image.png", mimeType: "image/png")
            
            var formData = [thumb]
            if let url = URL(string: urlString) {
                let movieData = try? Data(contentsOf: url, options: Data.ReadingOptions.alwaysMapped)
                if let data = movieData {
                    let movData = MultipartFormData(provider: .data(data), name: "videoFile", fileName: "video.mov", mimeType: "video/mov")
                    formData.append(movData)
                }
            }
            //attachments
            for img in post.additionImage {
                let data = UIImagePNGRepresentation(img)
                let thumb = MultipartFormData(provider: .data(data!), name: "attachments", fileName: "image.png", mimeType: "image/png")
                formData.append(thumb)
            }
            
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
    
    func getImage(from videoUrl: String) -> UIImage {
        let asset = AVURLAsset(url: URL(fileURLWithPath: videoUrl) , options: nil)
        
        let imgGenerator = AVAssetImageGenerator(asset: asset)
        imgGenerator.appliesPreferredTrackTransform = true
        if let cgImage = try?  imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil) {
            return UIImage(cgImage: cgImage)
        } else {
            return UIImage(named: "albums")!
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
