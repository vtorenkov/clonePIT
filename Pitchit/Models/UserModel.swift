//
//  UserModel.swift
//  Pitchit
//
//  Created by Alex on 9/17/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import SwiftyJSON

enum AccountType: Decodable  {
    init(from decoder: Decoder) throws {
        let label = try decoder.singleValueContainer().decode(String.self)
        switch label {
        case "business": self = .business
        case "personal": self = .personal
        default:
            self = .personal
        }
    }
    
    case business
    case personal
}

public class RegisterModel: Decodable  {
    var firstName = ""
    var lastName = ""
    var email = ""

    var fullName: String? = ""
    var userId: Int? = 0
    var phone: Int? = 0
    var passWord: String? = ""
    var passWordRepeat: String? = ""
    var imageUrl: String? = ""
    
    var accountType: AccountType? = .business
    var bussinesModel: BussinesModel? = BussinesModel()
    
    init() {}
    
    init(json:JSON) {
        self.userId = json["id"].intValue
        self.fullName = json["name"].stringValue
        self.imageUrl = json["picture"]["data"]["url"].stringValue
        self.email = json["email"].stringValue
    }
    
    func getUserImage() -> String? {
        guard let url = self.imageUrl else {
            return nil
        }
        if url.isEmpty {
            return nil
        }
        
        return url
    }
    
    func getUserFullName() -> String? {
        return self.firstName + " " + self.lastName
    }
}

class BussinesModel: Decodable {
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
