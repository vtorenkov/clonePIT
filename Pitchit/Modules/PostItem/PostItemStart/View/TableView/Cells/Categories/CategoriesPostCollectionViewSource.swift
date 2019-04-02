//
//  TableViewSource.swift
//
//  Created by Alexei Jovmir on 11/15/17.
//

import Foundation
import UIKit


protocol CategoriesPostInteract: class {
    func selectCategory(cat: CategoryItem)
}

final class CategoriesPostCollectionViewSource: NSObject, CategoriesPostDatasourceProtocol {
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    weak var delegateVC: CategoriesPostInteract?
    var type: String = ""
    var categories = CategoryManager.sharedInstance.items
    
    required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : CategoriesPostInteract, currentCat: String?) {
        self.collectionView = collectionView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.type = currentCat ?? ""
        
        super.init()
        
        self.collectionView?.register(cellType: PostItemCatCollectionViewCell.self)
        self.setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cat = categories[indexPath.row]
        
        let model = PostItemCatCollectionViewCellModel(cat: cat, currentCat: self.type)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}

class CategoriesPostDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    weak var delegate: CategoriesPostInteract?
    weak var collectionView: UICollectionView?
    var categories = CategoryManager.sharedInstance.items

    init(_ delegate: CategoriesPostInteract, collectionView: UICollectionView) {
        self.delegate = delegate
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.height * 0.8, height: self.collectionView!.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cat = categories[indexPath.row]
        self.delegate?.selectCategory(cat: cat)
    }
}

