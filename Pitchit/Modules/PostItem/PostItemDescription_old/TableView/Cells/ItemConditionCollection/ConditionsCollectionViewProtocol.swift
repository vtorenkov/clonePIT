//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol ConditionsCollectionDatasourceProtocol: UICollectionViewDataSource {
  
  weak var collectionView: UICollectionView? {get}
  weak var delegate: UICollectionViewDelegate? {get}
  
  init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : ConditionsCollectionInteract)
  
  func setupCollectionView()
}

extension ConditionsCollectionDatasourceProtocol {
  func setupCollectionView() {
    self.collectionView?.dataSource = self
    self.collectionView?.delegate = self.delegate
    self.collectionView?.reloadData()

  }
}
