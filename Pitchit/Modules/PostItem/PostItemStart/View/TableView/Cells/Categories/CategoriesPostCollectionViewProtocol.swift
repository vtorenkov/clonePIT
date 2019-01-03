//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit




protocol CategoriesPostDatasourceProtocol: UICollectionViewDataSource {
  
  weak var collectionView: UICollectionView? {get}
  weak var delegate: UICollectionViewDelegate? {get}
  
  init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : CategoriesPostInteract, currentCat: CategoryItemType?)
  
  func setupCollectionView()
}

extension CategoriesPostDatasourceProtocol {
  func setupCollectionView() {
    self.collectionView?.dataSource = self
    self.collectionView?.delegate = self.delegate
    self.collectionView?.reloadData()

  }
}
