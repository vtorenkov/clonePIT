//
//  SingleTextTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SingleTextTableViewCell: UITableViewCell, NibReusable, UITextFieldDelegate {
    var profile: UserProfile?
    var type: EditProfileType!

    @IBOutlet var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let user = profile else { return }
        switch type {
        case .phone?:
            user.mobileNo = textField.text ?? ""
        case .email?:
            user.email = textField.text ?? ""
        default:
            break
        }
    }
   
    static var reuseIdentifier: String { return "SingleTextTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SingleTextTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SingleTextTableViewCellModel {
    var type: EditProfileType
    var profile: UserProfile?
}

extension SingleTextTableViewCellModel: CellViewModel {
    func setup(cell: SingleTextTableViewCell) {
        cell.profile = profile
        cell.type = type
        switch type {
        case .email:
            cell.textField.placeholder = "Email"
            cell.textField.text = profile?.email
        case .phone:
            cell.textField.placeholder = "Phone"
            cell.textField.text = profile?.mobileNo
        default: break
        }
    }
}
