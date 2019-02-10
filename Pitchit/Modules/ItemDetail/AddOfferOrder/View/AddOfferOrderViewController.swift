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

    @IBOutlet var termsConsButton: UIButton!
    @IBOutlet var termsCondLabel: UILabel!
    @IBOutlet var yourOfferTextField: UITextField!
    @IBOutlet var yourOfferTitle: UILabel!
    @IBOutlet var currentPrice: UILabel!
    @IBOutlet var askingPrice: UILabel!
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
        setUpUI()
    }
    
    func setUpUI() {
        askingPrice.textColor = UIColor.white
        termsCondLabel.textColor = UIColor.white
        yourOfferTitle.textColor = UIColor.white
        currentPrice.textColor = UIColor.white
        currentPrice.roundCornersWhiteBorders()
        yourOfferTextField.roundCornersSmall()
    }

    @IBAction func termsConsAction(_ sender: Any) {
      
    }
}
