//
//  ShowResultsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/18/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class ShowResultsTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet var resultButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resultButton.roundCornersSmall()
    }
    
    static var reuseIdentifier: String { return "ShowResultsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ShowResultsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ShowResultsTableViewCellModel {
}

extension ShowResultsTableViewCellModel: CellViewModel {
    func setup(cell: ShowResultsTableViewCell) {
    }
}
