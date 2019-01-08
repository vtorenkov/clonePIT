//
//  HeaderTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 1/8/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell, NibReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    static var reuseIdentifier: String { return "HeaderTableViewCell" }
    static var nib: UINib { return UINib(nibName: "HeaderTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}
