//
//  UploadPItchTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class UploadPItchTableViewCell: UITableViewCell, NibReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none

    }
    weak var delegate: PostItemTableItemDelegate?
    weak var item: ItemModel?

    static var reuseIdentifier: String { return "UploadPItchTableViewCell" }
    static var nib: UINib { return UINib(nibName: "UploadPItchTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
    @IBAction func nextStepAction(_ sender: Any) {
        self.delegate?.nextPostItemScreen()
    }
}

struct UploadPItchTableViewCellModel {
    var type: AddItemCellType
    var delegate: PostItemTableItemDelegate
    var item: ItemModel?
}

extension UploadPItchTableViewCellModel: CellViewModel {
    func setup(cell: UploadPItchTableViewCell) {
        cell.delegate = delegate
        cell.item = item
    }
}
