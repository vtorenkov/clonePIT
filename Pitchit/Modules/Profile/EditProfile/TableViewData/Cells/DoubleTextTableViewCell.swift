//
//  DoubleTextTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class DoubleTextTableViewCell: UITableViewCell, NibReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static var reuseIdentifier: String { return "DoubleTextTableViewCell" }
    static var nib: UINib { return UINib(nibName: "DoubleTextTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct DoubleTextTableViewCellModel {
    var type: EditProfileType
}

extension DoubleTextTableViewCellModel: CellViewModel {
    func setup(cell: DoubleTextTableViewCell) {
    }
}
