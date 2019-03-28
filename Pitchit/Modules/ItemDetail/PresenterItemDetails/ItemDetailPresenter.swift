//
//  ItemDetailPresenter.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/28/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
class ItemDetailPresenter: NSObject, Presenter {
    
    typealias PresenterView = ItemDetailsViewController
    
    weak var view: PresenterView!
    
    fileprivate let service: UserViewClient!
    
    required init(view: PresenterView, service: UserViewClient = UserViewManager()) {
        self.view = view
        self.service = service
    }
    
    func getUserProfile(userId: String) {
        service.getUserProfile(userId: userId) { (items, succes) in
            
        }
    }
}
