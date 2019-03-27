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
    fileprivate let service: MainViewClient!
    
    required init(view: PresenterView, service: MainViewClient = MainViewManager()) {
        self.view = view
        self.service = service
    }
    
    func getAllFavorites() {
        service.getFavorites { [weak self] (favorites, success) in
            self?.view.favoritesViewDatasource?.favoritesArray = favorites ?? [FavoritesCodable]()
            self?.view.favoritesViewDatasource?.tableView?.reloadData()
        }
    }
}
