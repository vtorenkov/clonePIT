//
//  PaymentTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PaymentTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var paymentImage: UIImageView!
    @IBOutlet var paymentLabel: UILabel!
    @IBOutlet var changedLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var reuseIdentifier: String { return "PaymentTableViewCell" }
    static var nib: UINib { return UINib(nibName: "PaymentTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct PaymentTableViewCellModel {
    var type: EditProfileType
}

extension PaymentTableViewCellModel: CellViewModel {
    func setup(cell: PaymentTableViewCell) {
        switch type {
        case .paymentCard:
//            cell.paymentImage.image = ""
            cell.paymentLabel.text = "4444-5555-6666-7777"
            cell.changedLabel.text = "-"
        case .addPayment:
//            cell.paymentImage.image = ""
            cell.paymentLabel.text = "Add Payment Method"
            cell.changedLabel.text = "+"
        default: break

        }
    }
}
