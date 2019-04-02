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

struct CreatePostViewManager: CreatePostViewClient {
    let provider = MoyaProvider<CreatePostView>(plugins: [NetworkActivityPlugin { type,_  in
        switch type {
        case .began : SKActivityIndicator.show("Loading...")
        case .ended : SKActivityIndicator.dismiss()
        }
        }])
    
    func createPost(offer: ItemModel, completion: @escaping(ResultCreatePost)) {
        provider.request(.createPost(post: offer)) { (result) in
            switch result {
            case let .success(response):
                completion(true, response.description)
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
