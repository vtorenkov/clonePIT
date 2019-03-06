//
//  CellPhotosCollectionViewCell.swift
//  Rosenthal
//
//  Created by Jovmir Alexei on 12/28/17.
//  Copyright © 2017 PitchIt. All rights reserved.
//

import UIKit
import Kingfisher

class CategoriesCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var catImage: UIImageView!
    
    override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
    
  static var reuseIdentifier: String { return "CategoriesCollectionViewCell" }
  static var nib: UINib { return UINib(nibName: "CategoriesCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct CategoriesCollectionViewCellModel {
    var cat: CategoryItem
    var currentCat: CategoryItemType
}

extension CategoriesCollectionViewCellModel: CellViewModel {
  func setup(cell: CategoriesCollectionViewCell) {
    cell.categoryName.text = cat.name
    cell.backgroundColor = UIColor.violateCatBackGround
    if currentCat == cat.type  {
        cell.categoryName.textColor = UIColor.white
    } else {
        cell.categoryName.textColor = UIColor.white
    }
    cell.categoryName.font = UIFont.mainFonSFUItBold(ofSize: 12)
  }
}

