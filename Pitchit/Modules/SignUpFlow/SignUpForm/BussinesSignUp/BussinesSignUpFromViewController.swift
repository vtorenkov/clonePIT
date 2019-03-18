//
//  SignUpFromViewController.swift
//  Pitchit
//
//  Created by Alex on 9/15/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum BusinessSignUpType: Int {
    case businessName = 0
    case industry = 1
    case email = 2
    case phone = 3
    
    var placeholder: String {
        switch self {
        case .businessName:
            return "Business name"
        case .industry:
            return "Industry"
        case .email:
            return "Email"
        case .phone:
            return "Phone"
        }
    }
}

class BussinesSignUpFromViewController: UIViewController {
    var newUser = RegisterModel()
    @IBOutlet var floatingTextArray: [SkyFloatingLabelTextField]!
    @IBOutlet var nextStepButton: UIButton!
    @IBOutlet var gradientView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Bussines Account".uppercased()
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
                let type = BusinessSignUpType(rawValue: $0.tag)
                $0.placeholder = type?.placeholder
                $0.delegate = self
            }
        }
    }
    
    
    @IBAction func nextStep(_ sender: Any) {
        self.view.endEditing(true)
        if self.newUser.bussinesModel?.email.isValidEmail() ?? false {
            guard let bussinesModel = self.newUser.bussinesModel else {
                return
            }
            if bussinesModel.businessName.isEmpty || bussinesModel.industry.isEmpty || bussinesModel.email.isEmpty || bussinesModel.phone.isEmpty {
                self.alert(message: "Please complete all fields")
            } else {
                Router.sharedInstance.openBussinesDetailsSignUpForm(target: self, newUser: self.newUser)
            }
        } else {
            self.alert(message: "Email is Invalid")
        }
    }
}


extension BussinesSignUpFromViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if let type = BusinessSignUpType(rawValue: textField.tag){
            switch type {
            case .phone:
                textField.keyboardType = .phonePad
            default: break
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let type = BusinessSignUpType(rawValue: textField.tag), let text = textField.text  {
            guard let bussinesModel = self.newUser.bussinesModel else {
                return
            }
            switch type {
            case .businessName:
                bussinesModel.businessName = text
            case .industry:
                bussinesModel.industry = text
            case .email:
                bussinesModel.email = text
            case .phone:
                bussinesModel.phone = text
            }
        }
    }
}
