//
//  TableViewProtocol.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit

protocol CatsCollectionDatasourceProtocol: UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC: CatsCollectionInteract)
    func setupCollectionView()
}

extension CatsCollectionDatasourceProtocol {
    func setupCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
    }
}
