//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol AdditionalCollectionDatasourceProtocol: UICollectionViewDataSource {
  
  weak var collectionView: UICollectionView? {get}
  weak var delegate: UICollectionViewDelegate? {get}
  
  init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : AdditionalCollectionInteract, item: ItemModel?)
  
  func setupCollectionView()
}

extension AdditionalCollectionDatasourceProtocol {
  func setupCollectionView() {
    self.collectionView?.dataSource = self
    self.collectionView?.delegate = self.delegate
    self.collectionView?.reloadData()

  }
}
