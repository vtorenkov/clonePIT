//
//  ItemConditionTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 11/22/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

enum ConditionType: String {
    case brandNew = "Brand New"
    case likeNew = "Like New"
    case good = "Good"
    case acceptable = "Acceptable"
    case poor = "Poor"

    static let typesToGetRandomly = [ConditionType.brandNew.rawValue, ConditionType.likeNew.rawValue, ConditionType.good.rawValue, ConditionType.acceptable.rawValue, ConditionType.poor.rawValue]
}

import UIKit
import DropDown

class ItemConditionTableViewCell: UITableViewCell, NibReusable {
    let dropDownStatus = DropDown()
    
    @IBOutlet var buttonCondition: UIButton!
    weak var item: ItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.initStatusRange()
        // Initialization code
       
        buttonCondition.contentEdgeInsets = UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 30.0)
        buttonCondition.roundCornersButton()
        dropDownStatus.selectionAction = { [unowned self] (index: Int, item: String) in
            guard let itemModel = self.item else {
                return
            }
            
            if let type = ConditionType(rawValue: item) {
                self.buttonCondition.setTitle(type.rawValue, for: .normal)
                itemModel.conditionType = type
            } else {
                self.buttonCondition.setTitle(item, for: .normal)
            }
        }
    }
    
    func initStatusRange() {
        dropDownStatus.anchorView = buttonCondition
        var array = [String]()
        _ = ConditionType.typesToGetRandomly.map{array.append($0)}
        dropDownStatus.dataSource = array
    }
    
    @IBAction func statusFilterAction(_ sender: Any) {
        dropDownStatus.show()
    }
    
    static var reuseIdentifier: String { return "ItemConditionTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ItemConditionTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ItemConditionTableViewCellModel {
    var item: ItemModel?
}

extension ItemConditionTableViewCellModel: CellViewModel {
    func setup(cell: ItemConditionTableViewCell) {
        cell.item = item
        cell.buttonCondition.setTitle(item?.conditionType.rawValue, for: .normal)
    }
}
