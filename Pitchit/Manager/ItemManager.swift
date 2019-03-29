//
//  ItemManager.swift
//  Pitchit
//
//  Created by Alex on 8/26/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation


class ItemManager {
    static let sharedInstance : ItemManager = {
        let instance = ItemManager()
        return instance
    }()

    var items = [ItemModel]()
}

class CategoryManager {
    static let sharedInstance : CategoryManager = {
        let instance = CategoryManager()
        return instance
    }()
    
    var items = [CategoryItem]()
}
