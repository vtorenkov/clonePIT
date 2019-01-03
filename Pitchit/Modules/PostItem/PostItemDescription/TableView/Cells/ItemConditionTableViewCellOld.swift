//
//  ItemConditionTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/20/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//
/*
import UIKit

extension ItemConditionTableViewCell: ConditionsCollectionInteract {
    
}

class ItemConditionTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet var collectionView: UICollectionView!
    fileprivate var conditionsCollectionViewDatasource: ConditionsCollectionDatasource?
    fileprivate var conditionsCollectionViewDelegate: ConditionsCollectionDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    weak var item: ItemModel?

    override func layoutSubviews() {
        super.layoutSubviews()
        self.conditionsCollectionViewDelegate = ConditionsCollectionDelegate(self, collectionView: collectionView)
        self.conditionsCollectionViewDatasource = ConditionsCollectionDatasource(collectionView: collectionView, delegate: self.conditionsCollectionViewDelegate!, delegateVC: self)
    }
    
    static var reuseIdentifier: String { return "ItemConditionTableViewCell" }
    static var nib: UINib { return UINib(nibName: "ItemConditionTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct ItemConditionTableViewCellModel {
    var type: AddItemDescCellType
    var item: ItemModel?
}

extension ItemConditionTableViewCellModel: CellViewModel {
    func setup(cell: ItemConditionTableViewCell) {
        cell.item = item

        switch type {
        default: break
        }
    }
}
*/
