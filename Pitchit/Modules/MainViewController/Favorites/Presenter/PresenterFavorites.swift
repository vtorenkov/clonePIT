//
//  PresenterFavorites.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/27/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

class PresenterFavorites: NSObject, Presenter {
    
    typealias PresenterView = FavoritesViewController
    weak var view: PresenterView!
    fileprivate let serviceMain: MainViewClient!
    fileprivate let serviceAddFavorites: AddToFavoritesClient!

    required init(view: PresenterView, serviceMain: MainViewClient = MainViewManager(), serviceAddFavorites: AddToFavoritesClient = MainViewManager()) {
        self.view = view
        self.serviceAddFavorites = serviceAddFavorites
        self.serviceMain = serviceMain
    }
    
    func addToFavorites(favoriteId: String) {
        serviceAddFavorites.addToFavorites(offerId: favoriteId) { (succes) in
            self.getAllFavorites()
        }
    }
    
    func getPostDetails(postId: String) {
        serviceMain.getPost(postId: postId) { [weak self] (post, message) in
            if let post = post {
                let itemObject = ItemModel(codableItem: post)
                self?.view.openPost(item: itemObject)
            } else {
                self?.view.alert(message: message)
            }
        }
    }
    
    func getAllFavorites() {
        serviceMain.getFavorites(userId: nil) { [weak self] (favorites, success) in
            self?.view.favoritesViewDatasource?.favoritesArray = favorites ?? [ItemModelCodable]()
            self?.view.favoritesViewDelegate?.favoritesArray = favorites ?? [ItemModelCodable]()
            self?.view.favoritesViewDatasource?.tableView?.reloadData()
        }
    }
}
