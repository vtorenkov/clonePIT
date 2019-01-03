//
//  AnalyticsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 11/12/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class AnalyticsTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var watched: UILabel!
    @IBOutlet var views: UILabel!
    @IBOutlet var orderPostDate: UILabel!
    @IBOutlet var orderTitle: UILabel!
    @IBOutlet var orderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    static var reuseIdentifier: String { return "AnalyticsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AnalyticsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AnalyticsTableViewCellModel {
    var item: ItemModel
}

extension AnalyticsTableViewCellModel: CellViewModel {
    func setup(cell: AnalyticsTableViewCell) {
        cell.orderTitle.text = item.title
        cell.orderPostDate.text = item.dateOfPost
        cell.watched.text = "95%"
        cell.views.text = "123"
        cell.orderPostDate.text = "Posted 08/14/18"
        
        if let image = item.thumbImage {
            cell.orderImage.image = image
        }
    }
}
