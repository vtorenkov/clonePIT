//
//  AddOfferOrderViewController.swift
//  Orange
//
//  Created by Alex on 2/9/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class AddOfferOrderViewController: UIViewController {
    @IBOutlet var gradientView: UIView!
    weak var item: ItemModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: self.gradientView)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        if let item = self.item {
            self.title = item.title
        }
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItSemiBold(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradientView.addGradient()
    }

}
