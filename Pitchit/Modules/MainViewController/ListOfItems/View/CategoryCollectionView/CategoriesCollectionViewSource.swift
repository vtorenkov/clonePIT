//
//  TableViewSource.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit

protocol CategoriesCollectionInteract: class {
    func selectCategory(category: CategoryItem)
}

final class CategoriesCollectionDatasource: NSObject, CategoriesCollectionDatasourceProtocol {
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    weak var delegateVC: CategoriesCollectionInteract?
    
    weak var presenter: MainPresenter?
    weak var pageControll: UIPageControl!
    var category: CategoryItem = CategoryItem()
    var categories = [CategoryItem]()

    required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : CategoriesCollectionInteract, presenter: MainPresenter) {
        self.collectionView = collectionView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.presenter = presenter
        super.init()
        
        self.collectionView?.register(cellType: CategoriesCollectionViewCell.self)
        self.setupCollectionView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cat = categories[indexPath.row]
        let model = CategoriesCollectionViewCellModel(cat: cat, currentCat: self.category)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}


class CategoriesCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    weak var delegate: CategoriesCollectionInteract?
    weak var collectionView: UICollectionView?
    var categories = [CategoryItem]()
    
    init(_ delegate: CategoriesCollectionInteract, collectionView: UICollectionView) {
        self.delegate = delegate
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width / 2.5, height: self.collectionView!.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryItem = categories[indexPath.row]
        self.delegate?.selectCategory(category: categoryItem)
    }
}

