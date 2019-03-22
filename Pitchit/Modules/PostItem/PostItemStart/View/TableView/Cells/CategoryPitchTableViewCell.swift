//
//  CategoryPitchTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension CategoryPitchTableViewCell: CategoriesPostInteract {
    func selectCategory(cat: CategoryItem) {
        if let item = self.item {
//            item.type = cat.type
//            self.categoriesCollectionViewDatasource?.type = cat.type
//            self.collectionView.reloadData()
        }
    }
}


class CategoryPitchTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var categoriesCollectionViewDatasource: CategoriesPostCollectionViewSource?
    fileprivate var categoriesCollectionViewDelegate: CategoriesPostDelegate?
    weak var item: ItemModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.categoriesCollectionViewDelegate = CategoriesPostDelegate(self, collectionView: collectionView)
        self.categoriesCollectionViewDatasource = CategoriesPostCollectionViewSource(collectionView: collectionView, delegate: self.categoriesCollectionViewDelegate!, delegateVC: self, currentCat: self.item?.type)
    }
    
    static var reuseIdentifier: String { return "CategoryPitchTableViewCell" }
    static var nib: UINib { return UINib(nibName: "CategoryPitchTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct CategoryPitchTableViewCellModel {
    var type: AddItemCellType
    var item: ItemModel?
}

extension CategoryPitchTableViewCellModel: CellViewModel {
    func setup(cell: CategoryPitchTableViewCell) {
        cell.item = item
    }
}
