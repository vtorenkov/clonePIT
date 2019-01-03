//
//  MenuViewController.swift
//  Pitchit
//
//  Created by Alex on 7/12/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SideMenu
import FBSDKCoreKit
import FBSDKLoginKit
import Kingfisher

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
            Router.sharedInstance.openFavorites(target: self)
        case .Support:
            Router.sharedInstance.openSupport(target: self)
        case .SavedSearch:
            Router.sharedInstance.openSavedSearh(target: self)
        case .LogOut:
            self.alertYesNo(title: "Log out", message: "Are you sure you want to log out?") { (yes) in
                if yes {
                    self.dismiss(animated: false, completion: {
                        let loginManager = FBSDKLoginManager()
                        loginManager.logOut()
                        FBSDKAccessToken.setCurrent(nil)
                        
                        UserShared.sharedInstance.user = UserModel()
                        UserManager.deletePass()
                        Router.sharedInstance.logOut()
                    })
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
    
    deinit {
        print("deinit MenuViewController")
    }
    
    @IBOutlet var backGroundGradient: UIView!
    @IBOutlet var bottomView: UIView!
    fileprivate var menuViewDatasource: MenuTableViewDatasource?
    fileprivate var menuViewDelegate: MenuTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuViewDelegate = MenuTableViewDelegate(self)
        self.menuViewDatasource = MenuTableViewDatasource(tableView: tableView, delegate: self.menuViewDelegate!, delegateVC: self)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.backGroundGradient.addGradientMenu()
        self.bottomView.addGradient()
        self.avatarImage.setRounded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        if !UserShared.sharedInstance.user.imageUrl.isEmpty {
            let url = URL(string: UserShared.sharedInstance.user.imageUrl)
            avatarImage.kf.setImage(with: url)
        }
        self.nameUser.text = UserShared.sharedInstance.user.fullName
    }

    @IBAction func openEditProfile(_ sender: Any) {
        print("Edit profile")
        SideMenuManager.default.menuLeftNavigationController?.dismiss(animated: true, completion: nil)
    }
    
}
