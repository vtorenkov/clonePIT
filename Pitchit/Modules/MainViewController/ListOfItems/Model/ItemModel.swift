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
    var id = 0
    var title = ""
    var desc = ""
    var price = ""
    var videoUrl = ""
    var video = ""
    var place = ""
    var placeCoodinate: CLLocationCoordinate2D?
    var dateOfPost = ""
    
    var thumbImage: UIImage?
    
    var additionImage = [UIImage]()
    var additionImageUrl = [String]()

    var author = RegisterModel()
    var type: CategoryItemType = .art
    var conditionType: ConditionType = .brandNew
}
