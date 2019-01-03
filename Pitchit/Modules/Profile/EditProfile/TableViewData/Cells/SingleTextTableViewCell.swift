//
//  SingleTextTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SingleTextTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
    static var reuseIdentifier: String { return "SingleTextTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SingleTextTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SingleTextTableViewCellModel {
    var type: EditProfileType
}

extension SingleTextTableViewCellModel: CellViewModel {
    func setup(cell: SingleTextTableViewCell) {
        switch type {
        case .email:
            cell.textField.placeholder = "Email"
        case .phone:
            cell.textField.placeholder = "Phone"
        default: break
        }
    }
}
