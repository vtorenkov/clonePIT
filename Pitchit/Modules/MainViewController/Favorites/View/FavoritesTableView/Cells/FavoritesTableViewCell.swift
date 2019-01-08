//
//  UserCarUsTableViewCell.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell, NibReusable {
   
    @IBOutlet var heartFavorite: UIImageView!
    @IBOutlet var favoriteLastDate: UILabel!
    @IBOutlet var favoritePrice: NSLayoutConstraint!
    @IBOutlet var favoriteLabel: UILabel!
    @IBOutlet var favoritesImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.favoritesImage.setSmallRoundedCorners()
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
