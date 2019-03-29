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
            print("all")
        case .Favorites:
            print("Favorites")
        }
    }
}

class ProfileViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var profileTableViewDatasource: ProfileTableViewDatasource?
    fileprivate var profileTableViewDelegate: ProfileTableViewDelegate?
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
    }
    
    deinit {
        print("deinit ProfileViewController")
    }
    
    @IBAction func editProfile(_ sender: Any) {
        RouterProfile.sharedInstance.openEditProfile(target: self)
    }
    
    @IBAction func showAnalytics(_ sender: Any) {
        RouterProfile.sharedInstance.openAnalytics(target: self)
    }
}
