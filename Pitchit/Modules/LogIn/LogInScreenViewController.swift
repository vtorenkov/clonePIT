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

class LogInScreenViewController: UIViewController, FBSDKLoginButtonDelegate {
    @IBOutlet var gradientView: UIView!
    @IBOutlet var facebookButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        facebookButton.delegate = self
        facebookButton.readPermissions = ["public_profile","email"]

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserManager.isUserIsLoggin() {
            Router.sharedInstance.goToMainPage()
        } else if (FBSDKAccessToken.current() != nil) {
            self.fetchUserProfile()
        }
    }
    
    @IBAction func openMainPage(_ sender: Any) {
        Router.sharedInstance.goToMainPage()
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        Router.sharedInstance.openChooseType(target: self)
    }
    
    @IBAction func getFaceBookLogin(_ sender: Any) {
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("login")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if let _ = FBSDKAccessToken.current()
        {
            self.fetchUserProfile()
        }
    }
    
    func fetchUserProfile() {
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let json = JSON(result)
                print(json)
                UserShared.sharedInstance.user = UserModel(json: json)
                Router.sharedInstance.goToMainPage()
            }
        })
    }
}
