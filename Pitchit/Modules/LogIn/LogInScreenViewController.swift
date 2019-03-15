//
//  LogInScreenViewController.swift
//  Pitchit
//
//  Created by Alex on 9/5/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftyJSON
import GoogleSignIn

class LogInScreenViewController: UIViewController {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    lazy var presenter: LogInPresenter = LogInPresenter(view: self)
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var gradientView: UIView!
    @IBOutlet var facebookButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.roundCornersSmall()
        facebookButton.roundCornersSmall()
        
        self.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.gradientView.addGradient()
        self.manageUitextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserManager.isUserIsLoggin() {
            Router.sharedInstance.goToMainPage()
        } else if (FBSDKAccessToken.current() != nil) {
            self.fetchUserProfile()
        } else if (GIDSignIn.sharedInstance()?.currentUser != nil) {
            Router.sharedInstance.goToMainPage()
        }
    }
    
    @IBAction func loginClick(_ sender: Any) {
        presenter.login(email: "email@email.com", password: "password")

//        presenter.login(email: emailText.text, password: passwordText.text)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        Router.sharedInstance.openChooseType(target: self)
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("login")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let _ = FBSDKAccessToken.current() {
            self.fetchUserProfile()
        }
    }
    
    @IBAction func loginButtonGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile","email"], from: self) { (login, error) in
            if(error == nil){
                print("No Error")
                self.fetchUserProfile()
            }
        }
    }
    
    func fetchUserProfile() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let json = JSON(result)
                UserShared.sharedInstance.user = UserModel(json: json)
                Router.sharedInstance.goToMainPage()
            }
        })
    }
    
    func manageUitextField() {
        let attributes = [
            NSAttributedStringKey.foregroundColor: UIColor.placeholderColor,
            NSAttributedStringKey.font : UIFont.mainFonSFUItMedium(ofSize: 12)
        ]
        
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: attributes)
        emailText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 20))
        passwordText.leftView = paddingView
        passwordText.leftViewMode = .always
        let paddingViewSecond: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 20))
        emailText.leftView = paddingViewSecond
        emailText.leftViewMode = .always
    }
}

extension LogInScreenViewController: GIDSignInDelegate, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        Router.sharedInstance.goToMainPage()
    }
}

extension LogInScreenViewController: LogInPresenterProtocol{
    func alertShow(with string: String) {
        self.alert(message: string)
    }
}
