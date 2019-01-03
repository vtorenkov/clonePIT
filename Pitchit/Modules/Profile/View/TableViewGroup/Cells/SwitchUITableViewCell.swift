//
//  SwitchUITableViewCell.swift
//  Pitchit
//
//  Created by Alex on 9/8/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SwitchUITableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var switchPtofileOutlet: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switchAction(_ sender: Any) {
        switchPtofileOutlet.changeUnderlinePosition()

    }
    
    static var reuseIdentifier: String { return "SwitchUITableViewCell" }
    static var nib: UINib { return UINib(nibName: "SwitchUITableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SwitchUITableViewCellModel {
}

extension SwitchUITableViewCellModel: CellViewModel {
    func setup(cell: SwitchUITableViewCell) {
        cell.switchPtofileOutlet.addUnderlineForSelectedSegment()
    }
}
