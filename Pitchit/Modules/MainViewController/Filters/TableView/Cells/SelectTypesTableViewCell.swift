//
//  SelectTypesTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 12/18/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SelectTypesTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var titleLabelType: UILabel!
    fileprivate var typesCollectionViewDatasource: TypesCollectionDatasource?
    fileprivate var typesCollectionViewDelegate: TypesCollectionDelegate?
    var type: CategoryItemType!
    @IBOutlet var heightCollectionView: NSLayoutConstraint!
    @IBOutlet var collectionView: UICollectionView!
    var delegate: FilterTableItemDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        Types.buildModels(with: type)
       
        let numberOfItems = Double(Types.models.count)
        let numberOfLines = (Double(numberOfItems / 2)).rounded()
        let sizeHeight = CGFloat(50 * numberOfLines + ((numberOfLines - 1) * 10))
        heightCollectionView.constant = sizeHeight
        
        switch type! {
        case .vehicles:
            self.titleLabelType.text = "Im looking for"
        case .clothing:
            self.titleLabelType.text = "Select all that apply"
        default:
            self.titleLabelType.text = "Types"
        }
        
        self.typesCollectionViewDelegate = TypesCollectionDelegate(self, collectionView: collectionView, models: Types.models)
        self.typesCollectionViewDatasource = TypesCollectionDatasource(collectionView: collectionView, delegate: self.typesCollectionViewDelegate!, delegateVC: self, models: Types.models)
        
        self.layoutIfNeeded()
        self.collectionView.reloadData()
        self.collectionView.layoutIfNeeded()
    }

    static var reuseIdentifier: String { return "SelectTypesTableViewCell" }
    static var nib: UINib { return UINib(nibName: "SelectTypesTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct SelectTypesTableViewCellModel {
    let type: CategoryItemType
    let delegate: FilterTableItemDelegate
}

extension SelectTypesTableViewCellModel: CellViewModel {
    func setup(cell: SelectTypesTableViewCell) {
        cell.type = type
        cell.delegate = delegate
    }
}

extension SelectTypesTableViewCell: TypesCollectionInteract {
    func selectType(type: Types) {
        delegate.selectType(type: type)
    }
}
