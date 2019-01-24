//
//  TableViewProtocol.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit


protocol PitchCollectionDatasourceProtocol: UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : PitchCollectionInteract, presenter: MainPresenter, items: [ItemModel])
    
    func setupCollectionView()
}

extension PitchCollectionDatasourceProtocol {
    func setupCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
        
    }
}
