//
//  TableViewProtocol.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol TypesCollectionDatasourceProtocol: UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : TypesCollectionInteract, models: [CellViewAnyModel])
    
    func setupCollectionView()
}

extension TypesCollectionDatasourceProtocol {
    func setupCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
    }
}
