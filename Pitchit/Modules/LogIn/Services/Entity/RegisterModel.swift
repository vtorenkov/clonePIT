//
//  RegisterModel.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/14/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

public struct RegisterModel {
    var email = ""
    var firstName = ""
    var lastName = ""
    var mobileNo = 0
    var password = ""
    var cpassword = ""
}

extension RegisterModel: Decodable {

    enum RootKeys: String, CodingKey{
        case timezone, currently, daily
    }
    enum DailyKeys: String, CodingKey {
        case summary, icon, data
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
        timezone = try rootContainer.decode(String.self, forKey: .timezone)
        
        let dailyContainer = try rootContainer.nestedContainer(keyedBy: DailyKeys.self, forKey: .daily)
        
        current = try rootContainer.decode(Forecast.self, forKey: .currently)
        forecast = try dailyContainer.decode([Forecast].self, forKey: .data)
        summary = try dailyContainer.decode(String.self, forKey: .summary)
        
    }
}


