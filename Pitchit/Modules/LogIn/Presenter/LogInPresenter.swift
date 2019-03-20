//
//  LogInPresenter.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/13/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol LogInPresenterProtocol: class {
    func alertShow(with string: String)
    func sendToMainPage(newUser: RegisterModel)
}

class LogInPresenter: NSObject, Presenter {
    typealias PresenterView = LogInPresenterProtocol
    
    weak var view: PresenterView!
    fileprivate let service: LoginClient!
    
    required init(view: LogInPresenterProtocol, service: LoginClient = LoginManager()) {
        self.view = view
        self.service = service
    }
    
    func login(email: String?, password: String?) {
        guard let email = email, let pass = password else {
            view.alertShow(with: "Email or password is Empty")
            return
        }
        
        if email.isEmpty || pass.isEmpty {
            view.alertShow(with: "Email or password is Empty")
            return
        }
        
        if email.isValidEmail() {
            self.service.loginUser(email: email, password: pass) { [weak self] (registerModel, response) in
                if let regModel = registerModel {
                    self?.view.sendToMainPage(newUser: regModel)
                    //register regmodel in data
                } else {
                    self?.view.alertShow(with: response)
                }
            }
        } else {
            view.alertShow(with: "Email is Incorrect")
        }
    }
    
}
