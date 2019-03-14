//
//  LogInPresenter.swift
//  Pitchit
//
//  Created by Alexei Jovmir on 3/13/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol LogInPresenterProtocol: class {
    
}

class LogInPresenter: NSObject, Presenter {
    typealias PresenterView = LogInPresenterProtocol
    
    weak var view: PresenterView!
    fileprivate let service: LoginClient!
    
    required init(view: LogInPresenterProtocol, service: LoginClient = LoginManager()) {
        self.view = view
        self.service = service
    }
    
    func register() {
        self.service.registerUser(regModel: RegisterModel()) { (response) in
            print(response)
        }
    }
}
