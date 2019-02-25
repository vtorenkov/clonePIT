//
//  InviteFriendsViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class InviteFriendsViewController: UIViewController {
    @IBOutlet var gradiendView: UIView!
    @IBOutlet var textContact: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Invite Friends".uppercased()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItMedium(ofSize: 12)]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradiendView.addGradient()
        self.view.sendSubview(toBack: gradiendView)
        self.textContact.roundCornersSmall()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        closeProgramaticalyController()
    }
}
