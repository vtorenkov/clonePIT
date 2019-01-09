//
//  InquireViewController.swift
//  Pitchit
//
//  Created by Alex on 11/25/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit

class InquireViewController: UIViewController {
    weak var item: ItemModel?
    @IBOutlet var gradiendView: UIView!
    @IBOutlet var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: self.gradiendView)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        stackView.roundCorners()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradiendView.addGradient()
    }
}
