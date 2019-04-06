//
//  Networkable.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//
import Moya

protocol UserViewClient {
    typealias ResultGetProfile = (UserProfile?, String) -> ()
    typealias ResultUpdateProfile = (Bool, String) -> ()

    var provider: MoyaProvider<UserView> { get }
    func getUserProfile(userId: String, completion: @escaping(ResultGetProfile))
    func userUpdateProfile(user: UserProfile, completion: @escaping(ResultUpdateProfile))
}
