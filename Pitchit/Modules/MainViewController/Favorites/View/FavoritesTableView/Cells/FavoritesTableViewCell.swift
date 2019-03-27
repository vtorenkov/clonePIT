//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit

protocol FavoriteCellProtocol: class {
    func tapHeart(favoriteId: String)
}

class FavoritesTableViewCell: UITableViewCell, NibReusable {
    weak var delegate: FavoriteCellProtocol?
    
    @IBOutlet var heartFavorite: UIImageView!
    @IBOutlet var favoriteLastDate: UILabel!
    @IBOutlet var favoritePrice: UILabel!
    @IBOutlet var favoriteLabel: UILabel!
    @IBOutlet var favoritesImage: UIImageView!
    
    var favoriteItem: FavoritesCodable?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
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
        favoritesImage.setSmallRoundedCorners()
        
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleHeart(_:)))
        heartFavorite.addGestureRecognizer(tapGestureRecognizer)
        heartFavorite.isUserInteractionEnabled = true
    }
    
    static var reuseIdentifier: String { return "FavoritesTableViewCell" }
    static var nib: UINib { return UINib(nibName: "FavoritesTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct FavoritesTableViewCellModel {
    var favoriteItem: FavoritesCodable
    var delegate: FavoriteCellProtocol
}

extension FavoritesTableViewCellModel: CellViewModel {
    func setup(cell: FavoritesTableViewCell) {
        cell.delegate = delegate
        cell.favoriteItem = favoriteItem
    }
}

extension FavoritesTableViewCell {
    @objc func handleHeart(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let item = favoriteItem else {
            return
        }
        delegate?.tapHeart(favoriteId: item.id)
    }
}
