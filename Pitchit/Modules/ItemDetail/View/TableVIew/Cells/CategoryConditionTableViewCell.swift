//
//  CategoryConditionTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class CategoryConditionTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var conditionLabel: UILabel!
    @IBOutlet var labelType: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    weak var item: ItemModel?

    static var reuseIdentifier: String { return "CategoryConditionTableViewCell" }
    static var nib: UINib { return UINib(nibName: "CategoryConditionTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct CategoryConditionTableViewCellModel {
    var item: ItemModel?
}

extension CategoryConditionTableViewCellModel: CellViewModel {
    func setup(cell: CategoryConditionTableViewCell) {
        cell.item = item
        cell.labelType.text = item?.typeString
        cell.conditionLabel.text = item?.conditionType.rawValue
    }
}
