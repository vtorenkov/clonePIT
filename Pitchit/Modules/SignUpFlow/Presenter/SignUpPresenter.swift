//
//  SignUpPresenter.swift
//  Pitchit
//
//  Created by Alex on 3/17/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol SignUpPresenterProtocol: class {
    func alertShow(with string: String)
    func sendToMainScreen()
}

class SignUpPresenter: NSObject, Presenter {
    typealias PresenterView = SignUpPresenterProtocol
    
    weak var view: PresenterView!
    fileprivate let service: LoginClient!
    
    required init(view: SignUpPresenterProtocol, service: LoginClient = LoginManager()) {
        self.view = view
        self.service = service
    }
    
    func register(user: RegisterModel) {
        self.service.registerUser(regModel: user) { [weak self] (success, response) in
            self?.checkResponse(succes: success, response: response)
        }
    }
    
    func registerBusiness(user: RegisterModel) {
        self.service.registerBusinessUser(regModel: user) { [weak self]  (success, response) in
            self?.checkResponse(succes: success, response: response)
        }
    }
    
    func checkResponse(succes: Bool, response: String) {
        if succes {
            self.view.sendToMainScreen()
        } else {
            self.view.alertShow(with: response)
        }
    }
}
