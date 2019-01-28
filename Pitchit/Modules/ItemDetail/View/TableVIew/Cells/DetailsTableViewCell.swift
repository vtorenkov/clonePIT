//
//  DetailsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var titleItem: UILabel!
    @IBOutlet var datePosted: UILabel!
    @IBOutlet var detailedText: UITextView!
    
    weak var item: ItemModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        detailedText.textContainerInset = UIEdgeInsets.zero
        detailedText.textContainer.lineFragmentPadding = 0
    }
    
    static var reuseIdentifier: String { return "DetailsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "DetailsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct DetailsTableViewCellModel {
    var item: ItemModel?
}

extension DetailsTableViewCellModel: CellViewModel {
    func setup(cell: DetailsTableViewCell) {
        cell.item = item
        if let selectedItem = item {
            cell.titleItem.text = "Details"
            cell.detailedText.text = selectedItem.desc
            cell.datePosted.text = selectedItem.dateOfPost
        }
    }
}
