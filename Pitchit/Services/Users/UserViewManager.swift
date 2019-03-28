//
//  ClientManager.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya

struct UserViewManager: UserViewClient {
    let provider = MoyaProvider<UserView>()
    
    func getUserProfile(userId: String, completion: @escaping(ResultGetPosts)) {
        provider.request(.getUserProfile(userId: userId)) { (result) in
            switch result {
            case let .success(response):
                do {
//                    completion(response.description)
                }
                catch let error {
//                    completion(error.localizedDescription)
                }
            case let .failure(error): break
//                completion(self.parseErrorMessage(error: error))
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
