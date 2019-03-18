//
//  Networkable.swift
//  CapTemp
//
//  Created by Alexei Jovmir on 9/26/18.
//  Copyright © 2018 CapTech. All rights reserved.
//
import Moya

protocol LoginClient {
    typealias Success = NSError
    typealias ResultLogin = (RegisterModel?, String) -> ()
    typealias Result = (String) -> ()

    var provider: MoyaProvider<Login> { get }
    
    func registerUser(regModel: RegisterModel, completion: @escaping(Result))
    func registerBusinessUser(regModel: RegisterModel, completion: @escaping(Result))
    func loginUser(email: String, password: String, completion: @escaping(ResultLogin))
}
