//
//  SavedSearchView.swift
//  Pitchit
//
//  Created by Alex on 1/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class SavedSearchView: UIView, NibReusable {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var valueTitle: UILabel!
    
    func updateView(index: Int){
        switch index {
        case 0:
            self.titleLabel.text = "Looking for:"
            self.valueTitle.text = "MOTORCYCLES"
        case 1:
            self.titleLabel.text = "MILEAGE:"
            self.valueTitle.text = "20,000 -40,000"
        case 2:
            self.titleLabel.text = "YEAR:"
            self.valueTitle.text = "1989 - 2003"
        case 3:
            self.titleLabel.text = "MAKE:"
            self.valueTitle.text = "JEEP"
        case 4:
            self.titleLabel.text = "MODEL"
            self.valueTitle.text = "GRAND CHEROKEE"
        default:
            break
        }
    }
    
    static var nib: UINib { return UINib(nibName: "SavedSearchView", bundle: nil) }
}
