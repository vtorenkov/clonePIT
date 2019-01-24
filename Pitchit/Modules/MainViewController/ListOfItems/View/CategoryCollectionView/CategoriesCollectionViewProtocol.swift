//
//  TableViewProtocol.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit


protocol CategoriesCollectionDatasourceProtocol: UICollectionViewDataSource {
    
    weak var collectionView: UICollectionView? {get}
    weak var delegate: UICollectionViewDelegate? {get}
    
    init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : CategoriesCollectionInteract, presenter: MainPresenter)
    
    func setupCollectionView()
}

extension CategoriesCollectionDatasourceProtocol {
    func setupCollectionView() {
        self.collectionView?.dataSource = self
        self.collectionView?.delegate = self.delegate
        self.collectionView?.reloadData()
        
    }
}
