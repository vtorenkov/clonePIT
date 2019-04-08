//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol PhotosCollectionInteract {
    func selectingPhotoFromAdditional(image: String)
}


final class PhotosCollectionDatasource: NSObject, PhotosCollectionDatasourceProtocol {
  
  weak var collectionView: UICollectionView?
  weak var delegate: UICollectionViewDelegate?
  var delegateVC: PhotosCollectionInteract
    weak var item: ItemModel?

  var pageControll: UIPageControl!

  required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : PhotosCollectionInteract, item: ItemModel?) {
    self.collectionView = collectionView
    self.delegate = delegate
    self.delegateVC = delegateVC
    self.item = item
    super.init()
  
    self.collectionView?.register(cellType: AdditionalCollectionViewCell.self)
    self.setupCollectionView()
  }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = self.item else {
            return 0
        }
        return item.additionImageUrl.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let itemPhoto = item?.additionImageUrl[indexPath.row] else {
            return UICollectionViewCell()
        }
        let model = AdditionalCollectionViewCellModel(image: itemPhoto)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class PhotosCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
  var delegate: PhotosCollectionInteract
    weak var collectionView: UICollectionView?
    weak var item: ItemModel?


  init(_ delegate: PhotosCollectionInteract, collectionView: UICollectionView, item: ItemModel?) {
    self.delegate = delegate
    self.collectionView = collectionView
    self.item = item
  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.collectionView!.frame.size.height, height: self.collectionView!.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let itemPhoto = item?.additionImageUrl[indexPath.row] else {
            return
        }
        self.delegate.selectingPhotoFromAdditional(image: itemPhoto)
    }
}

