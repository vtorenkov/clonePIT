//
//  PurchaseOrderViewController.swift
//  Orange
//
//  Created by Alex on 2/9/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class PurchaseOrderViewController: UIViewController {
    @IBOutlet var gradientView: UIView!
    weak var item: ItemModel?

    @IBOutlet var termsConsButton: UIButton!
    @IBOutlet var termsCondLabel: UILabel!
    @IBOutlet var priceView: UIView!
    @IBOutlet var paymentMehod: UILabel!
    @IBOutlet var currentPrice: UILabel!
    @IBOutlet var confirmPurchase: UILabel!
    
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
        confirmPurchase.textColor = UIColor.white
        termsCondLabel.textColor = UIColor.white
        paymentMehod.textColor = UIColor.white
        currentPrice.textColor = UIColor.white
        currentPrice.roundCornersWhiteBorders()
        priceView.roundCornersSmall()
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
