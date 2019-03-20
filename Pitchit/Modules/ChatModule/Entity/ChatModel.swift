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
    var time: String
    var statusChat: StatusChat
    var offerType: OfferType
    var isFuture: Bool
    var price: Double
}

//MARK: mock chat models, just for testing.
let jsonChatModels = """
[{
"name": "1 Mid century lounge chair and more desc",
"statusChat": "readed",
"time": "12:50 PM",
"offerType": "buying",
"isFuture": false,
"price": 105.6
},
{
"name": "2 Mid century lounge chair and more desc 2",
"statusChat": "undreaded",
"time": "Yesterday",
"offerType": "selling",
"isFuture": true,
"price": 99.9
},
{
"name": "3 Mid century lounge chair and more desc 3",
"statusChat": "undreaded",
"time": "12:50 PM",
"offerType": "buying",
"isFuture": false,
"price": 55.6
},
{
"name": "4 Mid century lounge chair and more desc 5",
"statusChat": "readed",
"time": "Yesterday",
"offerType": "buying",
"isFuture": true,
"price": 23.9
}
]
"""

let data = jsonChatModels.data(using: .utf8)
var chatModelsSimple = try? JSONDecoder().decode([ChatModel].self, from: data!)

var chatModels = chatModelsSimple!.sorted { $0.isFuture && !$1.isFuture }

