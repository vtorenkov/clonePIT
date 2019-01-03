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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconPersonal.tintColor = UIColor.red
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
