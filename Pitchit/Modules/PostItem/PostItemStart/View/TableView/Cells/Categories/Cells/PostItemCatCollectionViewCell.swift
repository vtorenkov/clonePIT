//
//  PostItemCatCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/15/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PostItemCatCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    static var reuseIdentifier: String { return "PostItemCatCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "PostItemCatCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct PostItemCatCollectionViewCellModel {
    var cat: CategoryItem
    var currentCat: CategoryItemType
}

extension PostItemCatCollectionViewCellModel: CellViewModel {
    func setup(cell: PostItemCatCollectionViewCell) {
        cell.categoryName.text = cat.name
        if cat.type == currentCat {
            cell.categoryName.backgroundColor = UIColor.red
        } else {
            cell.categoryName.backgroundColor = UIColor.white
        }
        
        cell.categoryImage.image = cat.image
    }
}

