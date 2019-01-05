//
//  PersonalAccountTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 11/11/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PersonalAccountTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var iconPersonal: UIImageView!
    
    @IBOutlet var folowersNumber: UILabel!
    @IBOutlet var verifiedLabel: UILabel!
    @IBOutlet var accountType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        iconPersonal.tintColor = UIColor.red
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        folowersNumber.font = UIFont.mainFonSFUItRegular(ofSize: 12)
        verifiedLabel.font = UIFont.mainFonSFUItRegular(ofSize: 12)
        accountType.font = UIFont.mainFonSFUItRegular(ofSize: 10)
    }

    static var reuseIdentifier: String { return "PersonalAccountTableViewCell" }
    static var nib: UINib { return UINib(nibName: "PersonalAccountTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct PersonalAccountTableViewCellModel {
    var delegate: ProfileTableItemDelegate?
}

extension PersonalAccountTableViewCellModel: CellViewModel {
    func setup(cell: PersonalAccountTableViewCell) {
    }
}
