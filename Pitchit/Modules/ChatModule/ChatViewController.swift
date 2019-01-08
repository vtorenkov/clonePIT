//
//  ChatViewController.swift
//  Pitchit
//
//  Created by Alex on 8/29/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat".uppercased()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("deinit ChatViewController")
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

  
}
