//
//  MainPresenter.swift
//  Pitchit
//
//  Created by Alex on 7/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation


class MainPresenter: NSObject, Presenter {
    
    typealias PresenterView = MainViewController
    
    weak var view: PresenterView!
    
    fileprivate let service: MainViewClient!
    fileprivate let serviceFavorites: AddToFavoritesClient!

    required init(view: PresenterView, service: MainViewClient = MainViewManager(), serviceFavorites: AddToFavoritesClient = MainViewManager()) {
        self.view = view
        self.service = service
        self.serviceFavorites = serviceFavorites
    }
    
    func sendToFavorites(offerId: String) {
        self.serviceFavorites.addToFavorites(offerId: offerId) { (succes) in
            print(succes)
        }
    }
    
    func getPosts() {
        var items = [ItemModel]()
        self.service.getPosts(userId: nil) { [weak self] (itemsCodable, response) in
            itemsCodable?.forEach{items.append(ItemModel(codableItem: $0))}
            self?.view.items = items
            self?.view.pitchCollectionViewDelegate?.items = items
            self?.view.pitchCollectionViewDatasource?.items = items
            self?.view.pitchCollection.reloadData()
        }
        
        self.service.getCategories { [weak self] (categories, response) in
            self?.view.categoriesCollectionViewDelegate?.categories = categories ?? [CategoryItem]()
            self?.view.categoriesCollectionViewDatasource?.categories = categories ?? [CategoryItem]()
            self?.view.categoryCollection.reloadData()
            CategoryManager.sharedInstance.items = categories ?? [CategoryItem]()
        }
    }
}
