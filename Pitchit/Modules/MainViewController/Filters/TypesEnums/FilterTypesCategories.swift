//
//  FilterTypesCategories.swift
//  Pitchit
//
//  Created by Alex on 12/26/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation


enum Range: String {
    case sizeFootWear = "Select size range"
    case year = "Year"
    case mileage = "Mileage"
    
    static let rangeArray = [sizeFootWear, year, mileage]
}


enum SortBy: String {
    case lowToHight = "Low to High"
    case hightToLow = "High to Low"
    
    static let sortByArray = [lowToHight, hightToLow]
}

enum Types: String {
    static var models = [TypeCollectionViewCellModel]()
    case carTrucs = "Car and tucks"
    case moto = "Motorcycle"

    case rent = "Rent"
    case buy = "Buy"
    
    case adult = "Adult"
    case mens = "Mens"
    case women = "Women"
    case children = "Children"
    
    static func buildModels(with type: CategoryItemType) {
        switch type {
        case .vehicles:
            models = [TypeCollectionViewCellModel(type: .adult), TypeCollectionViewCellModel(type: .mens), TypeCollectionViewCellModel(type: .women), TypeCollectionViewCellModel(type: .children)]
        case .clothing:
            models = [TypeCollectionViewCellModel(type: .carTrucs), TypeCollectionViewCellModel(type: .moto)]
        case .realestate:
            models = [TypeCollectionViewCellModel(type: .rent), TypeCollectionViewCellModel(type: .buy)]

        default:
            models = [TypeCollectionViewCellModel(type: .carTrucs)]
        }
    }
}

