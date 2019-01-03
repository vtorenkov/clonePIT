//
//  RangeTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/18/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import RangeSeekSlider

class RangeTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet var rangeSlider: RangeSeekSlider!
    @IBOutlet var nameLabel: UILabel!
    var type: Range!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    static var reuseIdentifier: String { return "RangeTableViewCell" }
    static var nib: UINib { return UINib(nibName: "RangeTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct RangeTableViewCellModel {
    let type: Range
}

extension RangeTableViewCellModel: CellViewModel {
    func setup(cell: RangeTableViewCell) {
        cell.type = type
        cell.rangeSlider.tintColor = UIColor.white
        cell.nameLabel.text = type.rawValue
        cell.rangeSlider.lineHeight = 2.0
        cell.rangeSlider.minLabelFont = UIFont.mainFonSFUItRegular(ofSize: 15)
        cell.rangeSlider.maxLabelFont = UIFont.mainFonSFUItRegular(ofSize: 15)

        switch type {
        case .sizeFootWear:
            cell.rangeSlider.maxValue = 42
            cell.rangeSlider.selectedMaxValue = 42
            cell.rangeSlider.minValue = 35
            cell.rangeSlider.selectedMinValue = 35
        case .year:
            cell.rangeSlider.maxValue = 2020
            cell.rangeSlider.selectedMaxValue = 2020
            cell.rangeSlider.minValue = 1990
            cell.rangeSlider.selectedMinValue = 1990
        case .mileage:
            cell.rangeSlider.maxValue = 150
            cell.rangeSlider.selectedMaxValue = 150
            cell.rangeSlider.minValue = 1
            cell.rangeSlider.selectedMinValue = 1
        }
    }
}
