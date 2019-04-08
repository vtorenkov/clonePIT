//
//  AdditionalCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/21/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class AdditionalCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var additionalPhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.additionalPhoto.setRoundedCorners()
    }
    
    static var reuseIdentifier: String { return "AdditionalCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "AdditionalCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct AdditionalCollectionViewCellModel {
    var image: String
    var imageUI: UIImage?
}

extension AdditionalCollectionViewCellModel: CellViewModel {
    func setup(cell: AdditionalCollectionViewCell) {
        if let img = imageUI {
            cell.additionalPhoto.image = img
        } else {
            let url = URL(string: image)
            cell.additionalPhoto.kf.setImage(with: url)
        }
    }
}

