//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol ConditionsCollectionInteract {
}


final class ConditionsCollectionDatasource: NSObject, ConditionsCollectionDatasourceProtocol {
  
  weak var collectionView: UICollectionView?
  weak var delegate: UICollectionViewDelegate?
  var delegateVC: ConditionsCollectionInteract
 
  required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : ConditionsCollectionInteract) {
    self.collectionView = collectionView
    self.delegate = delegate
    self.delegateVC = delegateVC
   
    super.init()
  
    self.collectionView?.register(cellType: ConditionsCollectionViewCell.self)
    self.setupCollectionView()
  }
    
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = ConditionsCollectionViewCellModel()
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
    
}


class ConditionsCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
  var delegate: ConditionsCollectionInteract
    weak var collectionView: UICollectionView?


  init(_ delegate: ConditionsCollectionInteract, collectionView: UICollectionView) {
    self.delegate = delegate
    self.collectionView = collectionView
  }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: self.collectionView!.frame.size.height, height: self.collectionView!.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
  
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
  }
}

