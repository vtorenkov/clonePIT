//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol AdditionalCollectionInteract {
    func selectImageFullSize(image: UIImage?)
    func addPhoto()
}


final class AdditionalCollectionDatasource: NSObject, AdditionalCollectionDatasourceProtocol {
  
  weak var collectionView: UICollectionView?
  weak var delegate: UICollectionViewDelegate?
  var delegateVC: AdditionalCollectionInteract
    weak var item: ItemModel?

  required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : AdditionalCollectionInteract, item: ItemModel?) {
    self.collectionView = collectionView
    self.delegate = delegate
    self.delegateVC = delegateVC
    self.item = item

    super.init()
  
    self.collectionView?.register(cellType: AdditionalCollectionViewCell.self)
    self.collectionView?.register(cellType: NewAdditionalPhotoCollectionViewCell.self)
    self.setupCollectionView()
    
  }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = item else {
            return 1
        }
        return 1 + item.additionImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let model = NewAdditionalPhotoCollectionViewCellModel()
            return collectionView.dequeueReusableCell(with: model, for: indexPath)
        }
        guard let itemPhoto = item?.additionImage[indexPath.row - 1] else {
            return UICollectionViewCell()
        }
        
        let model = AdditionalCollectionViewCellModel(image: "itemPhoto")
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
  
  
    
}


class AdditionalCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
  var delegate: AdditionalCollectionInteract
    weak var collectionView: UICollectionView?
    weak var item: ItemModel?

  init(_ delegate: AdditionalCollectionInteract, collectionView: UICollectionView, item: ItemModel?) {
    self.delegate = delegate
    self.collectionView = collectionView
    self.item = item
  }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.collectionView!.frame.size.height, height: self.collectionView!.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        if indexPath.row != 0 {
            guard let itemPhoto = item?.additionImage[indexPath.row - 1] else {
                self.delegate.selectImageFullSize(image: nil)
                return
            }
            self.delegate.selectImageFullSize(image: itemPhoto)
        } else {
            self.delegate.addPhoto()
        }
    }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
  }
}

