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
        let id = checkIscurrentUserId(userId: userId)

        service.getUserProfile(userId: id) { (profile, succes) in
          
            self.profile = profile
            if id == UserManager.getCurrentUserObject().id {
                self.profile?.currentUser = true
            }
            self.view.profileTableViewDatasource?.profile = profile
            self.view.profileTableViewDelegate?.profile = profile
            self.view.profileTableViewDatasource?.tableView?.reloadData()
        }
    }
    
    func getPosts(userId: String) {
        let id = checkIscurrentUserId(userId: userId)
        var items = [ItemModel]()
        self.serviceMain.getPosts(userId: id) { [weak self] (itemsCodable, response) in
            itemsCodable?.forEach{items.append(ItemModel(codableItem: $0))}
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.tableView?.reloadData()
        }
    }
    
    func getFavorites(userId: String) {
        return
        let id = checkIscurrentUserId(userId: userId)
        var items = [ItemModel]()
        self.serviceMain.getFavorites(userId: id) { [weak self] (itemsCodable, response) in
            itemsCodable?.forEach{items.append(ItemModel(codableItem: $0))}
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.items = items
            self?.view.profileTableViewDatasource?.tableView?.reloadData()
        }
    }
    
    func checkIscurrentUserId(userId: String) -> String {
        var id = userId
        if id.isEmpty {
            id = UserManager.getCurrentUserObject().id
        }
        return id
    }
    
    func removeItemFromProfile(item: ItemModel) {
        serviceMain.deletePost(postId: item.id) { (success, message) in
            if success {
                /*
                self?.view.profileTableViewDatasource?.items = items
                self?.view.profileTableViewDatasource?.items = items
                self?.view.profileTableViewDatasource?.tableView?.reloadData()
 */
            } else {
                self.view?.alert(message: message)
            }
        }
    }
}
