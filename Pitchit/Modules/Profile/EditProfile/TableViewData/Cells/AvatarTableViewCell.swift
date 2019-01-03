//
//  AvatarTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var avatarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        if !UserShared.sharedInstance.user.imageUrl.isEmpty {
            let url = URL(string: UserShared.sharedInstance.user.imageUrl)
            avatarImage.kf.setImage(with: url)
        }
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layoutIfNeeded() // iOS 10 Fix
        avatarImage.setRounded()
    }
   
    static var reuseIdentifier: String { return "AvatarTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AvatarTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AvatarTableViewCellModel {
    var type: EditProfileType
}

extension AvatarTableViewCellModel: CellViewModel {
    func setup(cell: AvatarTableViewCell) {
    }
}
