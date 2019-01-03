//
//  NewAdditionalPhotoCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 10/27/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class NewAdditionalPhotoCollectionViewCell: UICollectionViewCell, NibReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var reuseIdentifier: String { return "NewAdditionalPhotoCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "NewAdditionalPhotoCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct NewAdditionalPhotoCollectionViewCellModel {
    
}

extension NewAdditionalPhotoCollectionViewCellModel: CellViewModel {
    func setup(cell: NewAdditionalPhotoCollectionViewCell) {
        cell.contentView.roundCornersButton()
    }
}

