//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit

protocol TypesCollectionInteract {
    func selectType(type: Types)
}

final class TypesCollectionDatasource: NSObject, TypesCollectionDatasourceProtocol {
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    var delegateVC: TypesCollectionInteract
    var pageControll: UIPageControl!
    
    var modelsForCells = [CellViewAnyModel]()
    required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : TypesCollectionInteract, models: [CellViewAnyModel]) {
        self.collectionView = collectionView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.modelsForCells = models
        super.init()
        
        self.collectionView?.register(cellType: TypeCollectionViewCell.self)
        self.setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelsForCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = modelsForCells[indexPath.row]
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class TypesCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    var delegate: TypesCollectionInteract
    weak var collectionView: UICollectionView?
    var modelsForCells = [CellViewAnyModel]()

    init(_ delegate: TypesCollectionInteract, collectionView: UICollectionView, models: [CellViewAnyModel]) {
        self.delegate = delegate
        self.collectionView = collectionView
        self.modelsForCells = models
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width / 2 - 5, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? TypeCollectionViewCell {
            delegate.selectType(type: cell.type)
        }
    }
}

