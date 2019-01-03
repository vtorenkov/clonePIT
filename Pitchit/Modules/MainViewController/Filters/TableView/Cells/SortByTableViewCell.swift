//
//  SortByTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/18/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import DropDown

enum SortType: String {
    case lowToHigh = "Price: Low to Hight"
    case hightLoLow = "Price: Hight to Low"
    
    static let sortTypes = [lowToHigh, hightLoLow]
}

class SortByTableViewCell: UITableViewCell, NibReusable {
    let dropDownStatus = DropDown()
    @IBOutlet var sortButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initStatusRange()
        self.selectionStyle = .none
        sortButton.titleLabel?.textAlignment = .center
        sortButton.roundCornersSmall()
        dropDownStatus.backgroundColor = UIColor.white

        sortButton.roundCornersButton()
        dropDownStatus.selectionAction = { [unowned self] (index: Int, item: String) in
            if let type = SortType(rawValue: item) {
                self.sortButton.setTitle(type.rawValue, for: .normal)
            } else {
                self.sortButton.setTitle(item, for: .normal)
            }
        }
    }
    
    func initStatusRange() {
        dropDownStatus.anchorView = sortButton
        var array = [String]()
        SortType.sortTypes.forEach{array.append($0.rawValue)}
        dropDownStatus.dataSource = array
    }
    
    @IBAction func sortFilterAction(_ sender: Any) {
        dropDownStatus.show()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    static var reuseIdentifier: String { return "SortByTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SortByTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SortByTableViewCellModel {
}

extension SortByTableViewCellModel: CellViewModel {
    func setup(cell: SortByTableViewCell) {
        cell.sortButton.setTitle("Price: Low to hight", for: .normal)
    }
}
