//
//  TextPitchTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension DescTextPitchTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let iT = self.item, let text = textField.text {
            iT.desc = text
        }
    }
}

class DescTextPitchTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var itemDescription: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    weak var item: ItemModel?
    
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textCellTitle: UILabel!
    
    static var reuseIdentifier: String { return "DescTextPitchTableViewCell" }
    static var nib: UINib { return UINib(nibName: "DescTextPitchTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct DescTextPitchTableViewCellModel {
    var item: ItemModel?
}

extension DescTextPitchTableViewCellModel: CellViewModel {
    func setup(cell: DescTextPitchTableViewCell) {
        cell.item = item
        cell.itemDescription.delegate = cell
        
        cell.textField.placeholder = "Describe your item"
        cell.textCellTitle.text = "Details"
        
    }
}
