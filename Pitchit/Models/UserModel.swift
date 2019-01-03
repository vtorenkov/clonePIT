//
//  UserModel.swift
//  Pitchit
//
//  Created by Alex on 9/17/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import SwiftyJSON

enum AccountType {
    case business
    case personal
}

class UserModel {
    var id = 0
    var firstName = ""
    var lastName = ""
    var phone = ""
    var email = ""
    var passWord = ""
    var passWordRepeat = ""
    var imageUrl = ""
    
    var accountType: AccountType = .business
    
    var bussinesModel = BussinesModel()
    
    var fullName: String = ""
    
    init() {
    }
    
    init(json:JSON) {
        self.id = json["id"].intValue
        self.fullName = json["name"].stringValue
        self.imageUrl = json["picture"]["data"]["url"].stringValue
        self.email = json["email"].stringValue
    }
}

class BussinesModel {
    var businessName = ""
    var industry = ""
    var address = ""
    var unit = ""
    var city = ""
    var state = ""
    var phone = ""
    var email = ""
    var zip = ""
}
