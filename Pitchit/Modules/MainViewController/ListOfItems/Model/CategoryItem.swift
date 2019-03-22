//
//  CategoryItem.swift
//  Pitchit
//
//  Created by Alex on 7/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

enum CategoryItemType: String {
    case art = "Art"
    case clothing = "Clothing"
    case electronics = "Electronics"
    case homeandgarden = "Home and garden"
    case jewelry = "Jewelry"
    case realestate = "Realestate"
    case services = "Services"
    case sports = "Sports"
    case vehicles = "Vehicles"
}


struct CategoryItem: Codable {
    var name: String
    let id: String
    let image: String
}
