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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: self.gradientView)
        if let item = self.item {
            self.title = item.title
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.mainFonSFUItSemiBold(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let itemButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = itemButton
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
        RouterItem.sharedInstance.openConfirmationScren(target: self)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func editCard(_ sender: Any) {
        RouterItem.sharedInstance.openAddCard(target: self)
    }
}
