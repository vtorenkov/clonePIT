//
//  PublicButtonTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/20/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PublicButtonTableViewCell: UITableViewCell, NibReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }
    weak var delegate: ItemDescTableItemDelegate?

    @IBAction func uploadItemAction(_ sender: Any) {
        self.delegate?.uploadItem()
    }
    
    static var reuseIdentifier: String { return "PublicButtonTableViewCell" }
    static var nib: UINib { return UINib(nibName: "PublicButtonTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct PublicButtonTableViewCellModel {
    var delegate: ItemDescTableItemDelegate
}

extension PublicButtonTableViewCellModel: CellViewModel {
    func setup(cell: PublicButtonTableViewCell) {
        cell.delegate = delegate
    }
}
