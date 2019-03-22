//
//  ItemModel.swift
//  Pitchit
//
//  Created by Alex on 8/22/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import MapKit

class ItemModel {
    var id = ""
    var title = ""
    var desc = ""
    var price = ""
    var videoUrl = ""
    var place = ""
    var dateOfPost = ""
    var is_favourite = true
    var sold = true

    var placeCoodinate: CLLocationCoordinate2D?
    var thumbImage: UIImage?
    var additionImage = [UIImage]()
    var additionImageUrl = [String]()

    var author = AuthorCodable()
    var conditionType: ConditionType = .brandNew
    
    init(codableItem: ItemModelCodable) {
        self.id = codableItem.id
        self.title = codableItem.title
        self.desc = codableItem.description
        self.price = codableItem.price
        self.placeCoodinate = CLLocationCoordinate2D(latitude: codableItem.latitude, longitude: codableItem.longitude)
        self.videoUrl = codableItem.videoUrl
        self.is_favourite = codableItem.is_favourite ?? false
        self.sold = codableItem.sold ?? false

        //add dependency from codable classes to this wrapper
        self.conditionType = ConditionType(rawValue: codableItem.productStatus) ?? .likeNew
        self.author = codableItem.seller
    }
    
    init() {}
}

class ItemModelCodable: Codable {
    var id = ""
    var title = "" 
    var description = ""
    var price = ""
    var videoUrl = ""
    var productStatus = ""
    var latitude: Double
    var longitude: Double
    var seller: AuthorCodable
    var is_favourite: Bool? = true
    var sold: Bool? = true
}

class AuthorCodable: Codable {
    var name = ""
    var userId: String? = ""
    var image: String? = ""
}

