//
//  PresenterDetails.swift
//  Pitchit
//
//  Created by Alex on 3/27/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation


class PresenterDetails: NSObject, Presenter {
    
    typealias PresenterView = ItemDetailsViewController
    weak var view: PresenterView!
    fileprivate let service: MainViewClient!
    fileprivate let serviceUser: AddToFavoritesClient!
    
    required init(view: PresenterView, service: MainViewClient = MainViewManager(), serviceUser: AddToFavoritesClient = MainViewManager()) {
        self.view = view
        self.service = service
        self.serviceUser = serviceUser
    }
    
    func sendToFavorites(offerId: String) {
        self.serviceUser.addToFavorites(offerId: offerId) { (succes) in
            print(succes)
        }
    }
}
