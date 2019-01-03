//
//  UserCarUsTableViewCell.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import UIKit
import Cosmos

class AvtarProfileTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var rateView: UIView!
    @IBOutlet var UserName: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    weak var delegate: ProfileTableItemDelegate?
    
    @IBOutlet var starRate: CosmosView!
    
    @IBOutlet var numberReviews: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        delegate?.tapOnrate()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        self.rateView.addGestureRecognizer(tapGestureRecognizer)
        
        self.UserName.text = UserShared.sharedInstance.user.fullName
        avatarImage.setRounded()
        if !UserShared.sharedInstance.user.imageUrl.isEmpty {
            let url = URL(string: UserShared.sharedInstance.user.imageUrl)
            avatarImage.kf.setImage(with: url)
        }
        
        starRate.settings.starSize = Double(starRate.frame.size.width / 5)
        starRate.settings.starMargin = 0.0
    }
    
    static var reuseIdentifier: String { return "AvtarProfileTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AvtarProfileTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AvtarProfileTableViewCellModel {
    var delegate: ProfileTableItemDelegate?
}

extension AvtarProfileTableViewCellModel: CellViewModel {
    func setup(cell: AvtarProfileTableViewCell) {
        cell.delegate = delegate
    }
}
