//
//  Networkable.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//
import Moya

protocol MainViewClient {
    typealias ResultGetPosts = ([ItemModelCodable]?, String) -> ()

    var provider: MoyaProvider<MainView> { get }
    func getPosts(completion: @escaping(ResultGetPosts))
}
