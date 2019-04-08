//
//  DoubleTextTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class DoubleTextTableViewCell: UITableViewCell, NibReusable, UITextFieldDelegate {
    
    @IBOutlet var surnameText: UITextField!
    @IBOutlet var nameText: UITextField!
    
    var profile: UserProfile?

    override func awakeFromNib() {
        super.awakeFromNib()
        surnameText.delegate = self
        nameText.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let user = profile else {return}
        if textField == nameText {
            user.firstName = textField.text ?? ""
        }
        
        if textField == surnameText {
            user.lastName = textField.text ?? ""
        }
    }

    static var reuseIdentifier: String { return "DoubleTextTableViewCell" }
    static var nib: UINib { return UINib(nibName: "DoubleTextTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct DoubleTextTableViewCellModel {
    var type: EditProfileType
    var profile: UserProfile?
}

extension DoubleTextTableViewCellModel: CellViewModel {
    func setup(cell: DoubleTextTableViewCell) {
        cell.profile = profile
        cell.surnameText.text = profile?.lastName
        cell.nameText.text = profile?.firstName
    }
}


