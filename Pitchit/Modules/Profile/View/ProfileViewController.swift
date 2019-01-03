//
//  ProfileViewController.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SideMenu

extension ProfileViewController: PitchCollectionInteract {
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
}

class ProfileViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    fileprivate var profileTableViewDatasource: ProfileTableViewDatasource?
    fileprivate var profileTableViewDelegate: ProfileTableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTableViewDelegate = ProfileTableViewDelegate(self)
        self.profileTableViewDatasource = ProfileTableViewDatasource(tableView: tableView, delegate: self.profileTableViewDelegate!, delegateVC: self, delegatePitch: self)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    deinit {
        print("deinit ProfileViewController")
    }
    
    @IBAction func showMenu(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    @IBAction func editProfile(_ sender: Any) {
        RouterProfile.sharedInstance.openEditProfile(target: self)
    }
    
    @IBAction func showAnalytics(_ sender: Any) {
        RouterProfile.sharedInstance.openAnalytics(target: self)
    }
}
