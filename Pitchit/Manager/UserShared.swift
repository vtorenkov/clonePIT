//
//  UserShared.swift
//  Pitchit
//
//  Created by Alex on 9/19/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation

class UserShared {
    
    static let sharedInstance : UserShared = {
        let instance = UserShared()
        return instance
    }()
    
    var user: RegisterModel = RegisterModel()
    
    func checkUserUrl() -> String? {
        guard let url = user.imageUrl else {
            return nil
        }
        if url.isEmpty {
            return nil
        }
        
        return url
    }
}
