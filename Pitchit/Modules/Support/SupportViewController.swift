//
//  SupportViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.roundCornersSmall()
        self.title = "Support".uppercased()
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
