//
//  SetPasswordViewController.swift
//  Pitchit
//
//  Created by Alex on 9/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum PasswordType: Int {
    case firstPass = 0
    case confirmPass = 1
    
    var placeholder: String {
        switch self {
        case .firstPass:
            return "Password"
        case .confirmPass:
            return "Conform Password"
        }
    }
}

class SetPasswordViewController: UIViewController {
    var newUser = RegisterModel()
    lazy var presenter: SignUpPresenter = SignUpPresenter(view: self)
    
    @IBOutlet var floatingTextArrayPass: [SkyFloatingLabelTextField]!
    @IBOutlet var gradiendView: UIView!
    @IBOutlet var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.title = "Set a Password".uppercased()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradiendView.addGradient()
        self.nextStepButton.circleCorners()
        
        _ = floatingTextArrayPass.map { unwrappedfloatingTextArray in
            _ = unwrappedfloatingTextArray.map {
                
                $0.font = UIFont.mainFonSFUItRegular(ofSize: 24)
                $0.textColor = UIColor.white
                $0.placeholderColor = UIColor.white
                $0.titleColor = UIColor.white
                $0.selectedTitleColor = UIColor.white
                $0.selectedLineColor = UIColor.white
                $0.placeholderFont = UIFont.mainFonSFUItSemiBold(ofSize: 24)
                $0.lineColor = UIColor.white
                
                let type = PasswordType(rawValue: $0.tag)
                $0.placeholder = type?.placeholder
                $0.delegate = self
            }
        }
    }
    
    @IBAction func showHide(_ sender: UIButton) {
        let textFields = floatingTextArrayPass.filter{$0.tag == sender.tag}
        textFields.first!.isSecureTextEntry = !textFields.first!.isSecureTextEntry
    }
    
    @IBAction func nextStep(_ sender: Any) {
        self.view.endEditing(true)
        if newUser.passWordRepeat == newUser.passWord, let type = newUser.accountType {
            switch type {
            case .business:
                self.presenter.registerBusiness(user: newUser)
            case .personal:
                self.presenter.register(user: newUser)
            }
        } else {
            self.alert(message: "Password didnt match")
        }
    }
}

extension SetPasswordViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let type = PasswordType(rawValue: textField.tag), let text = textField.text  {
            switch type {
            case .firstPass:
                self.newUser.passWord = text                
            case .confirmPass:
                self.newUser.passWordRepeat = text
            }
        }
    }
}

extension SetPasswordViewController: SignUpPresenterProtocol {
    func alertShow(with string: String) {
        self.alert(message: string)
    }
    
    func sendToMainScreen() {
//        UserManager.savePassword(user: newUser)
//        UserShared.sharedInstance.user = UserManager.getCurrentUserObject()
        self.navigationController?.popToRootViewController(animated: true)
//        Router.sharedInstance.goToMainPage()
    }
}
