//
//  BusinessDetailsViewController.swift
//  Pitchit
//
//  Created by Alex on 9/24/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum BusinessDetailsSignUpType: Int {
    case address = 0
    case unit = 1
    case city = 2
    case state = 3
    case zip = 4

    var placeholder: String {
        switch self {
        case .address:
            return "Address"
        case .unit:
            return "Unit (optional)"
        case .city:
            return "City"
        case .state:
            return "State"
        case .zip:
            return "ZIP"
        }
    }
}

class BusinessDetailsViewController: UIViewController {
    var newUser = RegisterModel()
    @IBOutlet var floatingTextArray: [SkyFloatingLabelTextField]!
    @IBOutlet var nextStepButton: UIButton!
    @IBOutlet var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Bussines Address".uppercased()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.nextStepButton.circleCorners()
        self.gradientView.addGradient()
        
        _ = floatingTextArray.map { unwrappedfloatingTextArray in
            _ = unwrappedfloatingTextArray.map {
                
                $0.font = UIFont.mainFonSFUItRegular(ofSize: 24)
                $0.textColor = UIColor.white
                $0.placeholderColor = UIColor.white
                $0.titleColor = UIColor.white
                $0.selectedTitleColor = UIColor.white
                $0.selectedLineColor = UIColor.white
                $0.placeholderFont = UIFont.mainFonSFUItSemiBold(ofSize: 24)
                $0.lineColor = UIColor.white
                let type = BusinessDetailsSignUpType(rawValue: $0.tag)
                $0.placeholder = type?.placeholder
                $0.delegate = self
            }
        }
    }
    
    
    @IBAction func nextStep(_ sender: Any) {
        self.view.endEditing(true)
        Router.sharedInstance.openSetPass(target: self, newUser: self.newUser)
    }
}


extension BusinessDetailsViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let type = BusinessDetailsSignUpType(rawValue: textField.tag){
            switch type {
            case .zip:
                textField.keyboardType = .phonePad
            default: break
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let type = BusinessDetailsSignUpType(rawValue: textField.tag), let text = textField.text  {
            guard let bussinesModel = self.newUser.bussinesModel else {
                return
            }
            switch type {
            case .address:
                bussinesModel.address = text
            case .unit:
                bussinesModel.unit = text
            case .city:
                bussinesModel.email = text
            case .state:
                bussinesModel.phone = text
            case .zip:
                bussinesModel.zip = text
            }
        }
    }
}
