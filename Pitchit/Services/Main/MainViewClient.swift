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
    typealias ResultGetCats = ([CategoryItem]?, String) -> ()
    typealias ResultGetFavorites = ([ItemModelCodable]?, String) -> ()

    var provider: MoyaProvider<MainView> { get }
    func getPosts(userId: String?, completion: @escaping(ResultGetPosts))
    func getCategories(completion: @escaping(ResultGetCats))
    func getFavorites(userId: String?, completion: @escaping(ResultGetFavorites))
}

protocol AddToFavoritesClient {
    typealias ResultAddToFavorites = (String) -> ()
    
    var provider: MoyaProvider<MainView> { get }
    func addToFavorites(offerId: String, completion: @escaping(ResultAddToFavorites))
}


