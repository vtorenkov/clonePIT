//
//  ProfileViewController.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

extension ProfileViewController: PitchCollectionInteract {
    func showUser(with id: String) {
    }
    
    func tapOnLike(item: ItemModel?) {
        self.alert(message: "Not yet implemented")
    }
}

extension ProfileViewController: ProfileTableItemDelegate {
    func selectItem(item: ItemModel) {
        RouterItem.sharedInstance.openItemDetails(target: self, item: item)
    }
    
    func tapOnrate() {
        RouterProfile.sharedInstance.openRateProfile(target: self)
    }
    
    func selectPosts(of type: PosrType) {
        switch type {
        case .All:
            presenter.getPosts(userId: userId)
        case .Favorites:
            presenter.getFavorites(userId: userId)
        }
    }
}

class ProfileViewController: UIViewController {
    
    @IBOutlet var editProfileButton: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    var profileTableViewDatasource: ProfileTableViewDatasource?
    var profileTableViewDelegate: ProfileTableViewDelegate?
    lazy var presenter: ProfilePresenter = ProfilePresenter(view: self)
    var userId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTableViewDelegate = ProfileTableViewDelegate(self)
        self.profileTableViewDatasource = ProfileTableViewDatasource(tableView: tableView, delegate: self.profileTableViewDelegate!, delegateVC: self, delegatePitch: self)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getUserProfile(userId: userId)
        presenter.getPosts(userId: userId)
        
        if userId.isEmpty {
            self.navigationItem.rightBarButtonItem = editProfileButton
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    @IBAction func editProfile(_ sender: Any) {
        RouterProfile.sharedInstance.openEditProfile(target: self, profile:  self.profileTableViewDatasource?.profile)
    }
    
    @IBAction func showAnalytics(_ sender: Any) {
        RouterProfile.sharedInstance.openAnalytics(target: self)
    }
}
