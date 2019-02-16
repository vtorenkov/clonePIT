//
//  ConfirmPurchaseViewController.swift
//  Pitchit
//
//  Created by Alex on 2/16/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class ConfirmPurchaseViewController: UIViewController {
    @IBOutlet var gradientView: UIView!
    @IBOutlet var viewShadow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "CONFIRMATION"
        self.navigationController?.navigationBar.tintColor = UIColor.navBarColorItem
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.navBarColorItem]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.addGradient()
        viewShadow.dropShadow(color: .black, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 1, scale: true)
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    @IBAction func doneConfirmation(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
