//
//  SwitchUITableViewCell.swift
//  Pitchit
//
//  Created by Alex on 9/8/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SwitchUITableViewCell: UITableViewCell, NibReusable {
    weak var delegate: ProfileTableItemDelegate?

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
    
    @IBAction func switchPost(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            delegate?.selectPosts(of: .All)
        } else {
            delegate?.selectPosts(of: .Favorites)
        }
        switchPtofileOutlet.changeUnderlinePosition()
    }

    static var reuseIdentifier: String { return "SwitchUITableViewCell" }
    static var nib: UINib { return UINib(nibName: "SwitchUITableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SwitchUITableViewCellModel {
    var delegate: ProfileTableItemDelegate?
    var userProfile: UserProfile
}

extension SwitchUITableViewCellModel: CellViewModel {
    func setup(cell: SwitchUITableViewCell) {
        cell.delegate = delegate
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
