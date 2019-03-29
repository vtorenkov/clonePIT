//
//  ProfilePresenter.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/28/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

class ProfilePresenter: NSObject, Presenter {
    typealias PresenterView = ProfileViewController
    weak var view: PresenterView!
    fileprivate let service: UserViewClient!
    fileprivate let serviceMain: MainViewClient!

    var profile: UserProfile?

    required init(view: PresenterView, service: UserViewClient = UserViewManager(), serviceMain: MainViewClient = MainViewManager()) {
        self.view = view
        self.service = service
        self.serviceMain = serviceMain
    }
    
    func getUserProfile(userId: String) {
        var id = userId
        if id.isEmpty {
            id = UserManager.getCurrentUserObject().id
        }
        service.getUserProfile(userId: id) { (profile, succes) in
            self.profile = profile
            self.view.profileTableViewDatasource?.profile = profile
            self.view.profileTableViewDatasource?.tableView?.reloadData()
        }
        self.getPosts(userId: id)
    }
    
    func getPosts(userId: String) {
        var items = [ItemModel]()
        self.serviceMain.getPosts(userId: userId) { [weak self] (itemsCodable, response) in
            itemsCodable?.forEach{items.append(ItemModel(codableItem: $0))}
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.tableView?.reloadData()
        }
    }
}
