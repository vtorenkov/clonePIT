//
//  TableViewSource.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit

protocol CatsCollectionInteract: class {
    func selectCategory()
}

final class CatsCollectionDatasource: NSObject, CatsCollectionDatasourceProtocol {
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    weak var delegateVC: CatsCollectionInteract?
    let item: [CategoryItem] = CategoryManager.sharedInstance.items

    required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : CatsCollectionInteract) {
        self.collectionView = collectionView
        self.delegate = delegate
        self.delegateVC = delegateVC
        super.init()
        
        self.collectionView?.register(cellType: CatsCollectionViewCell.self)
        self.setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cat = item[indexPath.row]
        let model = CatsCollectionViewCellModel(cat: cat)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class CatsCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    weak var delegate: CatsCollectionInteract?
    weak var collectionView: UICollectionView?
    
    init(_ delegate: CatsCollectionInteract, collectionView: UICollectionView) {
        self.delegate = delegate
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width / 2 - 6, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.selectCategory()
    }
}

