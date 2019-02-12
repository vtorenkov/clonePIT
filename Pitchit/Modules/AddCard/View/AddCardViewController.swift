//
//  AddCardViewController.swift
//  Pitchit
//
//  Created by Alex on 2/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Card"
        self.navigationController?.navigationBar.tintColor = UIColor.navBarColorItem
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.navBarColorItem]
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
}
