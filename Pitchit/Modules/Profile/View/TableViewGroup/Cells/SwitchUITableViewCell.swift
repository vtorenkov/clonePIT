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
        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.switchPtofileOutlet.addUnderlineForSelectedSegment()
    }
    
    @IBAction func switchAction(_ sender: Any) {
        switchPtofileOutlet.changeUnderlinePosition()
    }
    
    static var reuseIdentifier: String { return "SwitchUITableViewCell" }
    static var nib: UINib { return UINib(nibName: "SwitchUITableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SwitchUITableViewCellModel {
    var userProfile: UserProfile
}

extension SwitchUITableViewCellModel: CellViewModel {
    func setup(cell: SwitchUITableViewCell) {
        let widthSegment = kScreenWidth / 2
        cell.switchPtofileOutlet.setWidth(widthSegment, forSegmentAt: 0)
        cell.switchPtofileOutlet.setWidth(widthSegment, forSegmentAt: 1)
        
        cell.switchPtofileOutlet.tintColor = UIColor.switchBlue
        
        let titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        cell.switchPtofileOutlet.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        let titleTextAttributesUnselected = [NSAttributedStringKey.foregroundColor: UIColor.lightGray]
        cell.switchPtofileOutlet.setTitleTextAttributes(titleTextAttributesUnselected, for: .normal)
    }
}
