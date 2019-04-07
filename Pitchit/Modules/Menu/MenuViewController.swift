//
//  MenuViewController.swift
//  Pitchit
//
//  Created by Alex on 7/12/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Kingfisher
import GoogleSignIn

extension MenuViewController: MenuTableItemDelegate {
    func didClickMenu(type: MenuType) {
        switch type {
        case .Chats:
            Router.sharedInstance.openChat(target: self)
        case .Categories:
            Router.sharedInstance.openCategories(target: self)
        case .Settings:
            Router.sharedInstance.openSupport(target: self)
        case .InviteFriends:
            Router.sharedInstance.openInviteFriend(target: self)
        case .Favorites:
            RouterItem.sharedInstance.openFavorites(target: self)
        case .Support:
            Router.sharedInstance.openSupport(target: self)
        case .SavedSearch:
            Router.sharedInstance.openSavedSearh(target: self)
        case .LogOut:
            self.alertYesNo(title: "Log out", message: "Are you sure you want to log out?") { (yes) in
                if yes {
                    if (FBSDKAccessToken.current() != nil) {
                        let loginManager = FBSDKLoginManager()
                        loginManager.logOut()
                        FBSDKAccessToken.setCurrent(nil)
                        
                        UserShared.sharedInstance.user = RegisterModel()
                        Router.sharedInstance.logOut()
                    } else if (GIDSignIn.sharedInstance()?.currentUser != nil) {
                        GIDSignIn.sharedInstance().signOut()
                        Router.sharedInstance.logOut()
                    } else {
                        Router.sharedInstance.logOut()
                    }
                }
            }
            break
        }
    }
}

class MenuViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var nameUser: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var versionLabel: UILabel!
    
    @IBOutlet var backGroundGradient: UIView!
    @IBOutlet var bottomView: UIView!
    fileprivate var menuViewDatasource: MenuTableViewDatasource?
    fileprivate var menuViewDelegate: MenuTableViewDelegate?
    lazy var service: UserViewClient = UserViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuViewDelegate = MenuTableViewDelegate(self)
        self.menuViewDatasource = MenuTableViewDatasource(tableView: tableView, delegate: self.menuViewDelegate!, delegateVC: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.backGroundGradient.addGradientMenu()
        self.bottomView.addGradient()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.avatarImage.setRounded()
        avatarImage.layoutIfNeeded() // iOS 10 Fix
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let url = UserShared.sharedInstance.checkUserUrl() {
            let url = URL(string: url)
            avatarImage.kf.setImage(with: url)
        }
        self.nameUser.text = UserShared.sharedInstance.user.getUserFullName()
    }
    
    @IBAction func openEditProfile(_ sender: Any) {
        let id = UserManager.getCurrentUserObject().id
        service.getUserProfile(userId: id) { (profile, succes) in
            RouterProfile.sharedInstance.openEditProfile(target: self, profile:  profile)
        }
    }
}
