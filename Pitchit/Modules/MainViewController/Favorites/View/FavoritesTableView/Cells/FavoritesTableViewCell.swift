//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var heartFavorite: UIImageView!
    @IBOutlet var favoriteLastDate: UILabel!
    @IBOutlet var favoritePrice: UILabel!
    @IBOutlet var favoriteLabel: UILabel!
    @IBOutlet var favoritesImage: UIImageView!
    
    var favoriteItem: FavoritesCodable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let item = favoriteItem else {
            return
        }
        
        let url = URL(string: item.thumbNail)
        favoritesImage.kf.setImage(with: url)
        favoriteLabel.text = item.title
        favoritePrice.text = item.price
        favoriteLastDate.text = item.postedAt
        
        if item.is_favourite {
            heartFavorite.image = UIImage(named: "heart_red")
        } else {
            heartFavorite.image = UIImage(named: "heart")
        }
        
        self.favoritesImage.setSmallRoundedCorners()
        
    }
    
    static var reuseIdentifier: String { return "FavoritesTableViewCell" }
    static var nib: UINib { return UINib(nibName: "FavoritesTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct FavoritesTableViewCellModel {
    var favoriteItem: FavoritesCodable
}

extension FavoritesTableViewCellModel: CellViewModel {
    func setup(cell: FavoritesTableViewCell) {
        cell.favoriteItem = favoriteItem
    }
}
