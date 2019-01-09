//
//  UserCarUsTableViewCell.swift
//
//  Created by Alex Jovmir on 11/15/17.
//

import UIKit
import RangeSeekSlider

class LocationTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var sliderLocation: RangeSeekSlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    static var reuseIdentifier: String { return "LocationTableViewCell" }
    static var nib: UINib { return UINib(nibName: "LocationTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct LocationTableViewCellModel {
}

extension LocationTableViewCellModel: CellViewModel {
    func setup(cell: LocationTableViewCell) {
        cell.sliderLocation.disableRange = true
        cell.sliderLocation.lineHeight = 2.0
        cell.sliderLocation.tintColor = UIColor.white
    }
}
