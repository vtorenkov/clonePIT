//
//  UserCarUsTableViewCell.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import UIKit
import Cosmos

class AvtarProfileTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var gradientView: UIView!
    
    @IBOutlet var userAddress: UILabel!
    @IBOutlet var rateView: UIView!
    @IBOutlet var userName: UILabel!
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
        self.selectionStyle = .none
        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        rateView.addGestureRecognizer(tapGestureRecognizer)
        
        userName.text = UserShared.sharedInstance.user.getUserFullName()
        
        userName.text = userName.text?.uppercased()
        avatarImage.setRounded()
        
        if let url = UserShared.sharedInstance.checkUserUrl() {
            let url = URL(string: url)
            avatarImage.kf.setImage(with: url)
        }
        
        userName.font = UIFont.mainFonSFUItRegular(ofSize: 15)
        userAddress.font = UIFont.mainFonSFUItLight(ofSize: 17)
        numberReviews.font = UIFont.mainFonSFUItMedium(ofSize: 16)
        
        starRate.settings.starSize = Double(starRate.frame.size.width / 5)
        starRate.settings.starMargin = 0.0
        starRate.settings.filledColor = UIColor.white
        starRate.settings.filledBorderColor = UIColor.white
        starRate.settings.emptyBorderColor = UIColor.white
        
        if let layers = self.gradientView.layer.sublayers {
            layers.forEach{$0.removeFromSuperlayer()}
        }
        self.gradientView.addGradient()
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
