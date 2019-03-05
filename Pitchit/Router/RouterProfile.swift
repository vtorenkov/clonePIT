//
//  RouterProfile.swift
//  Pitchit
//
//  Created by Alex on 10/15/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit


class RouterProfile {
    
    static let sharedInstance : RouterProfile = {
        let instance = RouterProfile()
        return instance
    }()
    
    func openEditProfile(target: UIViewController?){
        let storyboard = UIStoryboard(name: "ProfileController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "EditProfileViewController") as? EditProfileViewController{
            let navigationController = UINavigationController(rootViewController: controller)
            target?.present(navigationController, animated: true, completion: nil)
        }
    }
    
    func openRateProfile(target: UIViewController?){
        let storyboard = UIStoryboard(name: "ProfileController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "RateViewController") as? RateViewController{
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func openAnalytics(target: UIViewController?){
        let storyboard = UIStoryboard(name: "ProfileController", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AnalyticsViewController") as? AnalyticsViewController{
            target?.navigationController?.pushViewController(controller, animated: true)
        }
    }

}
