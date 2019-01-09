//
//  ChooseTypeViewController.swift
//  Pitchit
//
//  Created by Alex on 9/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class ChooseTypeViewController: UIViewController {
    var newUser = UserModel()
    @IBOutlet var gradientView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Choose Account Type"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradientView.addGradient()
    }
 
    @IBAction func openPersonalSignUp(_ sender: Any) {
        self.newUser.accountType = .personal
        Router.sharedInstance.openSignUpForm(target: self, newUser: newUser)
    }
    
    @IBAction func openBusinessSignUp(_ sender: Any) {
        self.newUser.accountType = .business
        Router.sharedInstance.openBussinesSignUpForm(target: self, newUser: newUser)
    }
    
}
