//
//  RegisterModel.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/14/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
/*1
public class RegisterModel1: Decodable {
    var firstName = ""
    var lastName = ""
    var email = ""
    
    var fullName: String? = ""
//    var id: Int? = 0
    var phone: Int? = 0
    var passWord: String? = ""
    var passWordRepeat: String? = ""
    var imageUrl: String? = ""
    
    var accountType: AccountType? = .business
    var bussinesModel: BussinesModel? = BussinesModel()
    
    init() {}
    
    var isPersonal: Bool? = true
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

*/
