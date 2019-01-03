//
//  AdditionalPicsVidsTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/20/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension AdditionalPicsVidsTableViewCell: AdditionalCollectionInteract {
    func selectImageFullSize(image: UIImage?) {
        self.delegate?.selectImageFullSize(image: image)
        
        self.aditionalCollectionViewDelegate = AdditionalCollectionDelegate(self, collectionView: collectionView, item: item)
        self.aditionalCollectionViewDatasource = AdditionalCollectionDatasource(collectionView: collectionView, delegate: self.aditionalCollectionViewDelegate!, delegateVC: self, item: item)
        self.collectionView.reloadData()
    }
    
    func addPhoto() {
        self.delegate?.addPhoto()
    }
}


class AdditionalPicsVidsTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var aditionalCollectionViewDatasource: AdditionalCollectionDatasource?
    fileprivate var aditionalCollectionViewDelegate: AdditionalCollectionDelegate?
    weak var item: ItemModel?
    weak var delegate: ItemDescTableItemDelegate?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.aditionalCollectionViewDelegate = AdditionalCollectionDelegate(self, collectionView: collectionView, item: item)
        self.aditionalCollectionViewDatasource = AdditionalCollectionDatasource(collectionView: collectionView, delegate: self.aditionalCollectionViewDelegate!, delegateVC: self, item: item)
    }
    
    
    static var reuseIdentifier: String { return "AdditionalPicsVidsTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AdditionalPicsVidsTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AdditionalPicsVidsTableViewCellModel {
    var item: ItemModel?
    var delegate: ItemDescTableItemDelegate
}

extension AdditionalPicsVidsTableViewCellModel: CellViewModel {
    func setup(cell: AdditionalPicsVidsTableViewCell) {
        cell.item = item
        cell.delegate = delegate
    }
}
