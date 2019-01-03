//
//  SelecterTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/18/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import DropDown

/*
enum ConditionType: String {
    case brandNew = "Brand New"
    case likeNew = "Like New"
    case good = "Good"
    case acceptable = "Acceptable"
    case poor = "Poor"
    
    static let typesToGetRandomly = [ConditionType.brandNew.rawValue, ConditionType.likeNew.rawValue, ConditionType.good.rawValue, ConditionType.acceptable.rawValue, ConditionType.poor.rawValue]
}
*/

class SelecterTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet var nameLabel: UILabel!
    let dropDownStatus = DropDown()
    @IBOutlet var buttonCondition: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initStatusRange()
        // Initialization code
        self.selectionStyle = .none
        buttonCondition.titleLabel?.textAlignment = .center
        buttonCondition.roundCornersSmall()
        dropDownStatus.backgroundColor = UIColor.white
        
        buttonCondition.roundCornersButton()
        dropDownStatus.selectionAction = { [unowned self] (index: Int, item: String) in
            if let type = ConditionType(rawValue: item) {
                self.buttonCondition.setTitle(type.rawValue, for: .normal)
            } else {
                self.buttonCondition.setTitle(item, for: .normal)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func initStatusRange() {
        dropDownStatus.anchorView = buttonCondition
        var array = [String]()
        ConditionType.typesToGetRandomly.forEach{array.append($0)}
        dropDownStatus.dataSource = array
    }
    
    @IBAction func statusFilterAction(_ sender: Any) {
        dropDownStatus.show()
    }
    
    static var reuseIdentifier: String { return "SelecterTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SelecterTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SelecterTableViewCellModel {
}

extension SelecterTableViewCellModel: CellViewModel {
    func setup(cell: SelecterTableViewCell) {
        cell.buttonCondition.setTitle("Brand New", for: .normal)

    }
}
