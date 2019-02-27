//
//  ChatModel.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 2/27/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

struct ChatModel:Codable {
    enum StatusChat: String, Codable {
        case readed
        case undreaded
    }
    
    enum OfferType: String, Codable {
        case buying
        case selling
    }
    
    var name: String
    var statusChat: StatusChat
    var offerType: OfferType
}

//MARK: mock chat models, just for testing.
let json = """
[{
"name": "Item for sale 1",
"statusChat": "readed",
"offerType": "buying"
},
{
"name": "Item for sale 2",
"statusChat": "undreaded",
"offerType": "selling"
}
]
"""

let data = json.data(using: .utf8)
let chatModels = try? JSONDecoder().decode([ChatModel].self, from: data!)

