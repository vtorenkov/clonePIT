//
//  Networkable.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//
import Moya

protocol CreatePostViewClient {
    typealias ResultCreatePost = (String) -> ()

    var provider: MoyaProvider<CreatePostView> { get }
    func createPost(offer: ItemModel, completion: @escaping(ResultCreatePost))
}
