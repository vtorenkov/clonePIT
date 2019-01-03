//
//  RangeMinusPlusButtonsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/26/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class RangeMinusPlusButtonsTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var firstButton: UIView!
    @IBOutlet var secondButton: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        firstButton.roundCornersSmall()
        secondButton.roundCornersSmall()
    }
    
    static var reuseIdentifier: String { return "RangeMinusPlusButtonsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "RangeMinusPlusButtonsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct RangeMinusPlusButtonsTableViewCellModel {
    
}

extension RangeMinusPlusButtonsTableViewCellModel: CellViewModel {
    func setup(cell: RangeMinusPlusButtonsTableViewCell) {
    }
}
