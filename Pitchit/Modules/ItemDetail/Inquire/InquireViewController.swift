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
    
    @IBOutlet var purchaseButton: UIButton!
    @IBOutlet var makeAnOffer: UIButton!
    @IBOutlet var messageSeller: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubview(toBack: self.gradiendView)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        stackView.roundCorners()
        purchaseButton.roundCornersButton()
        makeAnOffer.roundCornersButton()
        messageSeller.roundCornersButton()
        
        let itemButton = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = itemButton
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        RouterItem.sharedInstance.openPurchaseOrder(target: self, item: self.item)
    }
    
    @IBAction func messageAction(_ sender: Any) {
        Router.sharedInstance.openChat(target: self)
    }
    
    @IBAction func makeAnOffer(_ sender: Any) {
        RouterItem.sharedInstance.openAddOfferOrder(target: self, item: self.item)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradiendView.addGradient()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
