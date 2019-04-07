//
//  UserProfile.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/28/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

public class UserProfile: Codable {
    var id = ""
    var firstName = ""
    var lastName = ""
    var image: String? = ""
    var city: String? = ""
    var state: String? = ""
    var topRated: String? = ""
    var licenceVerified: Bool? = false
    var facebookConnected: Bool? = false
    var creditCardVerified: Bool? = false
    var reviewCount = 0
    var followerCount = 0
    
    var phoneNumber: String? = ""
    var editedImage: Data?
    var email: String?
}



/*
 
 "data": {
 "id": "12441436-59ef-11e7-9002-0a3e46e83204",
 "firstName": "David",
 "lastName": "",
 "image": "https:\/\/graph.facebook.com\/10154651749616146\/picture?width=200&height=150",
 "city": null,
 "state": null,
 "topRated": null,
 "licenceVerified": false,
 "facebookConnected": false,
 "creditCardVerified": false,
 "reviewCount": 3,
 "followerCount": 3
 }
 
 
 */
