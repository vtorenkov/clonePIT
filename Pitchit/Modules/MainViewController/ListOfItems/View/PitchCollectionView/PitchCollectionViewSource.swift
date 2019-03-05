//
//  TableViewSource.swift
//
//  Created by Jovmir Alexei on 11/15/17.
//

import Foundation
import UIKit


protocol PitchCollectionInteract: class {
    func tapOnLike(item: ItemModel?)
}

final class PitchCollectionDatasource: NSObject, PitchCollectionDatasourceProtocol {
    
    weak var collectionView: UICollectionView?
    weak var delegate: UICollectionViewDelegate?
    weak var delegateVC: PitchCollectionInteract?
    var items = [ItemModel]()
    weak var presenter: MainPresenter?
    var category: CategoryItemType = .art
    
    required init(collectionView: UICollectionView, delegate: UICollectionViewDelegate, delegateVC : PitchCollectionInteract, presenter: MainPresenter, items: [ItemModel]) {
        self.collectionView = collectionView
        self.delegate = delegate
        self.delegateVC = delegateVC
        self.presenter = presenter
        self.items = items
        super.init()
        
        self.collectionView?.register(cellType: PitchCollectionViewCell.self)
        self.setupCollectionView()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.items.count == 0 {
            self.collectionView?.setEmptyMessage("Nothing to show in \(category.rawValue) category. Add new Items.")
        } else {
            self.collectionView?.restore()
        }
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let model = PitchCollectionViewCellModel(item: item, delegate: delegateVC)
        return collectionView.dequeueReusableCell(with: model, for: indexPath)
    }
}

class PitchCollectionDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    weak var delegate: PitchCollectionInteract?
    weak var collectionView: UICollectionView?
    weak var controller: UIViewController?
    var items = [ItemModel]()
    
    init(_ delegate: PitchCollectionInteract, collectionView: UICollectionView, items: [ItemModel]) {
        self.delegate = delegate
        self.collectionView = collectionView
        self.items = items
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView!.frame.size.width, height: self.collectionView!.frame.size.height/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DispatchQueue.main.async { [unowned self] in
            let item = self.items[indexPath.row]
            RouterItem.sharedInstance.openItemDetails(target: self.controller, item: item)
        }
    }
}

