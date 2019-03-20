//
//  ClientManager.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//

import Foundation
import Moya

struct MainViewManager: MainViewClient {
    let provider = MoyaProvider<MainView>()

    func getPosts(completion: @escaping (ResultGetPosts)) {
        provider.request(.getPosts()) { (result) in
            switch result {
            case let .success(response):
                
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .secondsSince1970
                    let items = try filteredResponse.map([ItemModelCodable].self, atKeyPath: "data", using: decoder)
                    completion(items, response.description)
                }
                catch let error {
                    completion(nil, error.localizedDescription)
                }
            case let .failure(error):
                completion(nil, self.parseErrorMessage(error: error))
            }
        }
    }

    func parseErrorMessage(error: MoyaError) -> String {
        do {
            if let body = try error.response?.mapJSON() as? NSDictionary, let mess = body.value(forKey: "Message") as? String {
                return mess
            }
        } catch {
            return error.localizedDescription
        }
        return "Error, something happens"
    }
}