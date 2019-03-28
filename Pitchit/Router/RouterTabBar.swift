//
//  RouterTabBar.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/28/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

class RouterTabBar: GlobalRouter {
    
    static let sharedInstance : RouterTabBar = {
        let instance = RouterTabBar()
        return instance
    }()
    
    func openProfileTab(targer: UIViewController, porfileId: String) {
        if let tabs = targer.tabBarController?.viewControllers {
            for (index, nav) in tabs.enumerated() {
                if nav is UINavigationController {
                    if let vc = (nav as! UINavigationController).topViewController! as? ProfileViewController {
                        vc.userId = porfileId
                        targer.tabBarController?.selectedIndex = index
                    }
                }
            }
        }
    }
}
