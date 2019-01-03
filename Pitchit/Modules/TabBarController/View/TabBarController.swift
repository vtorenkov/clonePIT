//
//  TabBarController.swift
//  Pitchit
//
//  Created by Alex on 7/6/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    deinit {
        print("deinit TabBarController")
    }
    
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.title == "postItem_title".localized() {
            let storyboard3 = UIStoryboard(name: "PostItemController", bundle: nil)
            let controller3: PostItemController = storyboard3.instantiateViewController(withIdentifier: "PostItemController") as! PostItemController
            let navigationController2 = UINavigationController(rootViewController: controller3)

            self.present(navigationController2, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let iconMain = UITabBarItem(title: "Main", image: UIImage(named: "main"), selectedImage: UIImage(named: "main"))
       
        let storyboardMain = UIStoryboard(name: "MainViewController", bundle: nil)
        let controllerMain: MainViewController = storyboardMain.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        controllerMain.title = "main_title".localized()
        controllerMain.tabBarItem = iconMain

        let iconPost = UITabBarItem(title: "Post", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo"))
        let storyboardPost = UIStoryboard(name: "PostItemController", bundle: nil)
        let controllerPost: PostItemController = storyboardPost.instantiateViewController(withIdentifier: "PostItemController") as! PostItemController
        controllerPost.title = "postItem_title".localized()
        controllerPost.tabBarItem = iconPost

        let iconProfile = UITabBarItem(title: "Profile", image: UIImage(named: "user"), selectedImage: UIImage(named: "user"))
        let storyboardProfile = UIStoryboard(name: "ProfileController", bundle: nil)
        let controllerProfile: ProfileViewController = storyboardProfile.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        controllerProfile.title = "profile_title".localized()
        controllerProfile.tabBarItem = iconProfile

        self.tabBar.barTintColor = UIColor.black
        self.tabBar.tintColor = UIColor.white
        self.tabBar.unselectedItemTintColor = UIColor.lightGray

        
        let controllers = [controllerMain, controllerPost, controllerProfile]
        let controllerWithNav = controllers.map { UINavigationController(rootViewController: $0) }
        viewControllers = controllerWithNav
        
        _ = controllerWithNav.map {
            $0.navigationBar.tintColor = UIColor.black;
            $0.navigationBar.barTintColor = UIColor.navBarColor
            $0.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black]
        }
    }

}
