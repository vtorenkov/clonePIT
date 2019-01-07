//
//  UserCarUsTableViewCell.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell, NibReusable {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  static var reuseIdentifier: String { return "FavoritesTableViewCell" }
  static var nib: UINib { return UINib(nibName: "FavoritesTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct FavoritesTableViewCellModel {
}

extension FavoritesTableViewCellModel: CellViewModel {
  func setup(cell: FavoritesTableViewCell) {
  }
}
