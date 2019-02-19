//
//  Router.swift
//  Pitchit
//
//  Created by Alex on 7/24/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit


class Router {
    
    enum RouterPresentationStyle {
        case push
        case present
    }
    
    static let sharedInstance : Router = {
        let instance = Router()
        return instance
    }()
    
    func openChooseType(target: UIViewController?){
        let storyboard = UIStoryboard(name: "ChooseType", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ChooseTypeViewController") as? ChooseTypeViewController{
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openSetPass(target: UIViewController?, newUser: UserModel){
        let storyboard = UIStoryboard(name: "SetPassword", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SetPasswordViewController") as? SetPasswordViewController{
            controller.newUser = newUser
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openSignUpForm(target: UIViewController?, newUser: UserModel){
        let storyboard = UIStoryboard(name: "SignUpForm", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SignUpFromViewController") as? SignUpFromViewController{
            controller.newUser = newUser
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openBussinesSignUpForm(target: UIViewController?, newUser: UserModel){
        let storyboard = UIStoryboard(name: "BussinesSignUpForm", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "BussinesSignUpFromViewController") as? BussinesSignUpFromViewController{
            controller.newUser = newUser
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openBussinesDetailsSignUpForm(target: UIViewController?, newUser: UserModel){
        let storyboard = UIStoryboard(name: "BussinesSignUpForm", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "BusinessDetailsViewController") as? BusinessDetailsViewController{
            controller.newUser = newUser
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openSupport(target: UIViewController?){
        let storyboard = UIStoryboard(name: "SupportModule", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SupportViewController") as? SupportViewController{
            let navigationController = UINavigationController(rootViewController: controller)
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openInviteFriend(target: UIViewController?){
        let storyboard = UIStoryboard(name: "InviteFriends", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "InviteFriendsViewController") as? InviteFriendsViewController{
            let navigationController = UINavigationController(rootViewController: controller)
            
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openSavedSearh(target: UIViewController?){
        let storyboard = UIStoryboard(name: "SavedSearch", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "SavedSearchViewController") as? SavedSearchViewController{
            let navigationController = UINavigationController(rootViewController: controller)
            
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openCategories(target: UIViewController?, presentationStyle: RouterPresentationStyle = .push){
        let storyboard = UIStoryboard(name: "CategoriesModule", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "CategoriesViewController") as? CategoriesViewController{
            pushOrPresentController(target: target, controller: controller, presentationStyle: presentationStyle)
        }
    }
    
    func openFilterView(target: UIViewController?, type: CategoryItemType) {
        let storyboard = UIStoryboard(name: "MainViewController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "FiltersViewController") as? FiltersViewController{
            controller.type = type
            let navigationController = UINavigationController(rootViewController: controller)
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openChat(target: UIViewController?, presentationStyle: RouterPresentationStyle = .push){
        let storyboard = UIStoryboard(name: "ChatModule", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController {
            pushOrPresentController(target: target, controller: controller, presentationStyle: presentationStyle)
        }
    }
    
    func logOut(){
        let storyboard = UIStoryboard(name: "LogInScreen", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "LogInScreenViewController") as? LogInScreenViewController{
            let navigationController = UINavigationController(rootViewController: controller)
            UIApplication.shared.keyWindow?.rootViewController = navigationController
        }
    }
    
    func goToMainPage(){
        let storyboard = UIStoryboard(name: "TabBarController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController {
            UIApplication.shared.keyWindow?.rootViewController = controller
        }
    }
    
    func pushOrPresentController(target: UIViewController?, controller: UIViewController, presentationStyle: RouterPresentationStyle) {
        switch presentationStyle {
        case .present:
            let navigationController = UINavigationController(rootViewController: controller)
            target?.present(navigationController, animated: true, completion: nil)
        case .push:
            if let target = target as? UINavigationController {
                target.pushViewController(controller, animated: true)
            } else {
                target?.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
