//
//  RateViewController.swift
//  Pitchit
//
//  Created by Alex on 11/11/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import Cosmos
import KMPlaceholderTextView

class RateViewController: UIViewController {

    @IBOutlet var yourRateDesc: KMPlaceholderTextView!
    @IBOutlet var starRate: CosmosView!
    
    @IBAction func submitReview(_ sender: Any) {
    }
    @IBOutlet var reviewText: KMPlaceholderTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Review"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        starRate.settings.starSize = Double(starRate.frame.size.width / 5)
        starRate.settings.starMargin = 0.0

        yourRateDesc.layer.borderWidth = 1
        yourRateDesc.layer.borderColor = UIColor.lightGray.cgColor
    }
 
}
