//
//  UIViewController+Extension.swift
//  Pitchit
//
//  Created by Alex on 9/3/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alertYesNo(title: String, message: String, completionHandler:@escaping (Bool) -> ()) {
        let refreshAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            completionHandler(true)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            completionHandler(false)
        }))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
