//
//  GlobalRouter.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/28/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

class GlobalRouter {
    enum RouterPresentationStyle {
        case push
        case present
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
