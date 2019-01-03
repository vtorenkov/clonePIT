//
//  AdditionalPhotosTableViewCell.swift
//  Pitchit
//
//  Created by Alex on 8/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension AdditionalPhotosTableViewCell: PhotosCollectionInteract {
    func selectingPhotoFromAdditional(image: UIImage?) {
        self.delegate?.showImageFullSize(image: image)
    }
}

class AdditionalPhotosTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet var collectionView: UICollectionView!
    
    fileprivate var photosCollectionViewDatasource: PhotosCollectionDatasource?
    fileprivate var photosCollectionViewDelegate: PhotosCollectionDelegate?
    var delegate: ItemDetailsTableItemDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    weak var item: ItemModel?

    override func layoutSubviews() {
        super.layoutSubviews()
        self.photosCollectionViewDelegate = PhotosCollectionDelegate(self, collectionView: collectionView, item: item)
        self.photosCollectionViewDatasource = PhotosCollectionDatasource(collectionView: collectionView, delegate: self.photosCollectionViewDelegate!, delegateVC: self, item: item)
    }
    
    static var reuseIdentifier: String { return "AdditionalPhotosTableViewCell" }
    static var nib: UINib { return UINib(nibName: "AdditionalPhotosTableViewCell", bundle: nil) } // Use VeryCustomUI.xib
}

struct AdditionalPhotosTableViewCellModel {
    var item: ItemModel?
    var delegate: ItemDetailsTableItemDelegate?
}

extension AdditionalPhotosTableViewCellModel: CellViewModel {
    func setup(cell: AdditionalPhotosTableViewCell) {
        cell.item = item
        cell.delegate = delegate
    }
}
