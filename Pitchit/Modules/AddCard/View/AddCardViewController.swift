//
//  AddCardViewController.swift
//  Pitchit
//
//  Created by Alex on 2/12/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {
    @IBOutlet var cardTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Card"
        self.navigationController?.navigationBar.tintColor = UIColor.navBarColorItem
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.navBarColorItem]

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 60))
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = UIFont.mainFonSFUItMedium(ofSize: 15)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(saveAction), for: .touchUpInside)
        cardTextField.inputAccessoryView = button
    }
    
    @objc func saveAction() {
        print("save")
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
}
