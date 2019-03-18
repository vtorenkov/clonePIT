//
//  UserModel.swift
//  Pitchit
//
//  Created by Alex on 9/17/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import SwiftyJSON

enum AccountType: Codable  {
    
    enum Key: CodingKey {
        case rawValue
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Key.self)
        switch self {
        case .business:
            try container.encode(0, forKey: .rawValue)
        case .personal:
            try container.encode(1, forKey: .rawValue)
        }
    }
    
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

public class RegisterModel: Codable  {
    var firstName = ""
    var lastName = ""
    var email = ""

    var fullName: String? = ""
    var userId: Int = 0
    var phone: Int? = 0
    var passWord: String? = ""
    var passWordRepeat: String? = ""
    var imageUrl: String? = ""
    
    var accountType: AccountType? = .business
    var bussinesModel: BussinesModel? = BussinesModel()
    
    public required init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.userId = try map.decode(Int.self, forKey: .userId)
        } catch {
            self.userId = 0
        }
        
        self.firstName = try map.decode(String.self, forKey: .firstName)
        self.lastName = try map.decode(String.self, forKey: .lastName)
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
    
    func getUserFullName() -> String {
        return self.firstName + " " + self.lastName
    }
    
    init() {}
    
    init(json:JSON) {
        self.userId = json["id"].intValue
        self.fullName = json["name"].stringValue
        self.imageUrl = json["picture"]["data"]["url"].stringValue
        self.email = json["email"].stringValue
    }
}

class BussinesModel: Codable {
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
