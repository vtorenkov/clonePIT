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
    var profile: UserProfile?

    required init(view: PresenterView, service: UserViewClient = UserViewManager()) {
        self.view = view
        self.service = service
    }
    
    func getUserProfile(userId: String) {
        service.getUserProfile(userId: userId) { (profile, succes) in
            self.profile = profile
            self.view.profileTableViewDatasource?.profile = profile
            self.view.profileTableViewDatasource?.tableView?.reloadData()
        }
    }
}
