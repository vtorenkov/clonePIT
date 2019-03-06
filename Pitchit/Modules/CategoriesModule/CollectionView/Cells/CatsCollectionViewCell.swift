//
//  CellPhotosCollectionViewCell.swift
//  Rosenthal
//
//  Created by Jovmir Alexei on 12/28/17.
//  Copyright © 2017 PitchIt. All rights reserved.
//

import UIKit
import Kingfisher

class CatsCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var catNameLabel: UILabel!
    
    @IBOutlet var catImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var reuseIdentifier: String { return "CatsCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "CatsCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.roundCorners()
    }
}

struct CatsCollectionViewCellModel {
}

extension CatsCollectionViewCellModel: CellViewModel {
    func setup(cell: CatsCollectionViewCell) {
    }
}

