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
    
    var name: String
    var statusChat: StatusChat
}

//MARK: mock chat models, just for testing.
let json = """
[{
"name": "Item for sale 1",
"statusChat": "readed"
},
{
"name": "Item for sale 2",
"statusChat": "undreaded"
}
]
"""

let data = json.data(using: .utf8)
let chatModels = try? JSONDecoder().decode([ChatModel].self, from: data!)

