//
//  PhotosCollectionViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/9/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class TypeCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet var typeButton: UIButton!
//    @IBOutlet var typeLabel: UILabel!
//    @IBOutlet var viewBackGround: UIView!
    var type: Types!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func selectType(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
           self.typeButton.backgroundColor = UIColor.lightGray
        }  else {
            self.typeButton.backgroundColor = UIColor.white
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.typeButton.roundCornersSmall()
    }

    static var reuseIdentifier: String { return "TypeCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "TypeCollectionViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct TypeCollectionViewCellModel {
    var type: Types
}

extension TypeCollectionViewCellModel: CellViewModel {
    func setup(cell: TypeCollectionViewCell) {
        cell.type = type
        cell.typeButton.setTitle(type.rawValue, for: .normal)
        cell.typeButton.setTitleColor(UIColor.black, for: .normal)
        cell.typeButton.setTitleColor(UIColor.black, for: .selected)

    }
}

