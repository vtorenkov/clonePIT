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

class CategoryItem {
    var name: String
    var type: CategoryItemType
    let color: UIColor
    let image: UIImage?
    
    init(type: CategoryItemType) {
        self.name = type.rawValue
        self.type = type
        
        let array = [UIColor.robinsEggBlue, UIColor.carolinaBlue, UIColor.cornflower,
                     UIColor.menuGray, UIColor.darkGray, UIColor.black,
                     UIColor.ice, UIColor.cornflower90, UIColor.lightGray]

        switch type {
            case .art:
                self.image = UIImage(named: "art")
                color = array[0]
            case .clothing:
                self.image = UIImage(named: "clothing")
                color = array[1]
            case .electronics:
                self.image = UIImage(named: "electronics")
                color = array[2]
            case .homeandgarden:
                self.image = UIImage(named: "homeandgarden")
                color = array[3]
            case .jewelry:
                self.image = UIImage(named: "jewelry")
                color = array[4]
            case .realestate:
                self.image = UIImage(named: "realestate")
                color = array[5]
            case .services:
                self.image = UIImage(named: "services")
                color = array[6]
            case .sports:
                self.image = UIImage(named: "sports")
                color = array[7]
            case .vehicles:
                self.image = UIImage(named: "sports")
                color = array[8]
        }
    }
}

let categories = [CategoryItem(type:.art),
                  CategoryItem(type:.clothing),
                  CategoryItem(type:.electronics),
                  CategoryItem(type:.homeandgarden),
                  CategoryItem(type:.jewelry),
                  CategoryItem(type:.realestate),
                  CategoryItem(type:.services),
                  CategoryItem(type:.sports),
                  CategoryItem(type:.vehicles)]
