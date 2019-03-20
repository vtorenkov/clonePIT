//
//  ProfileTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 7/28/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import Cosmos
class ProfileTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var gradientView: UIView!
    weak var item: ItemModel?
    @IBOutlet var UserName: UILabel!
    @IBOutlet var profileAvatar: UIImageView!
    @IBOutlet var starRate: CosmosView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        profileAvatar.setRounded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let user = item?.author else {
            return
        }
        
        self.UserName.text = user.name
        if let url = user.image {
            let url = URL(string: url)
            profileAvatar.kf.setImage(with: url)
        }
        
        profileAvatar.layoutIfNeeded() // iOS 10 Fix
        profileAvatar.setRounded()
        
        starRate.settings.starMargin = 0.0
        starRate.settings.filledColor = UIColor.white
        starRate.settings.filledBorderColor = UIColor.white
        starRate.settings.emptyBorderColor = UIColor.white

        self.gradientView.addGradient()
    }
    
    static var reuseIdentifier: String { return "ProfileTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ProfileTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ProfileTableViewCellModel {
    var item: ItemModel?
}

extension ProfileTableViewCellModel: CellViewModel {
    func setup(cell: ProfileTableViewCell) {
        cell.item = item
        cell.backgroundColor = UIColor.white
    }
}
