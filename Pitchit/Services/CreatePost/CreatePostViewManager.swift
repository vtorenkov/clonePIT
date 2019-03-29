//
//  ClientManager.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya

struct CreatePostViewManager: CreatePostViewClient {
    let provider = MoyaProvider<CreatePostView>()
    
    func createPost(offer: ItemModel, completion: @escaping(ResultCreatePost)) {
        provider.request(.createPost(post: offer)) { (result) in
            switch result {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let profile = try filteredResponse.map(UserProfile.self, atKeyPath: "data", using: decoder)
                    completion(response.description)
                }
                catch let error {
                    completion(error.localizedDescription)
                }
            case let .failure(error):
                completion(self.parseErrorMessage(error: error))
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
