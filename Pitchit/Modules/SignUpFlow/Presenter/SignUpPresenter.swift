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
}

class SignUpPresenter: NSObject, Presenter {
    typealias PresenterView = SignUpPresenterProtocol
    
    weak var view: PresenterView!
    fileprivate let service: LoginClient!
    
    required init(view: SignUpPresenterProtocol, service: LoginClient = LoginManager()) {
        self.view = view
        self.service = service
    }
    
    
    func register() {
        self.service.registerUser(regModel: RegisterModel()) { (response) in
            print(response)
        }
    }
}
