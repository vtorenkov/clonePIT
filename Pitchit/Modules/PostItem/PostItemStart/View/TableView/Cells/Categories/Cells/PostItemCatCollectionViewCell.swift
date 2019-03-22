//
//  PostItemCatCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/15/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PostItemCatCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var whiteDeselected: UIView!
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryName.font = UIFont.mainFonSFUItMedium(ofSize: 12)
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
//        if cat.type == currentCat {
//            cell.whiteDeselected.alpha = 0.0
//        } else {
//            cell.whiteDeselected.alpha = 0.5
//        }
        let url = URL(string: cat.image)
        cell.categoryImage.kf.setImage(with: url)
    }
}

