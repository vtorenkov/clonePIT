//
//  ConditionsCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/21/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class ConditionsCollectionViewCell: UICollectionViewCell, NibReusable {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var reuseIdentifier: String { return "ConditionsCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "ConditionsCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
    
}

struct ConditionsCollectionViewCellModel {
    
}

extension ConditionsCollectionViewCellModel: CellViewModel {
    func setup(cell: ConditionsCollectionViewCell) {
        
    }
}

