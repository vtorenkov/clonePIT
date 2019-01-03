//
//  PhotosCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/9/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet var imageAdditional: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageAdditional.setRoundedCorners()
    }
    static var reuseIdentifier: String { return "PhotosCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "PhotosCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct PhotosCollectionViewCellModel {
    
}

extension PhotosCollectionViewCellModel: CellViewModel {
    func setup(cell: PhotosCollectionViewCell) {
        
    }
}

