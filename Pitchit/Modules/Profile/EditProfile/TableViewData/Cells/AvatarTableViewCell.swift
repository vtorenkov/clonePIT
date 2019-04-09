//
//  AvatarTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell, NibReusable {
    weak var profile: UserProfile?
    @IBOutlet var avatarImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImage.layoutIfNeeded() // iOS 10 Fix
        avatarImage.setRounded()
        
        if let url = UserShared.sharedInstance.checkUserUrl() {
            let url = URL(string: url)
            avatarImage.kf.setImage(with: url)
        } else if let data = profile?.editedImage {
            if let img = UIImage(data: data) {
                avatarImage.image = img
            } else {
                avatarImage.image = UIImage(named: "placeholder_avatar")
            }
        } else {
            avatarImage.image = UIImage(named: "placeholder_avatar")
        }
    }
    
    static var reuseIdentifier: String { return "AvatarTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AvatarTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AvatarTableViewCellModel {
    var type: EditProfileType
    var profile: UserProfile?
}

extension AvatarTableViewCellModel: CellViewModel {
    func setup(cell: AvatarTableViewCell) {
        cell.profile = profile
    }
}
