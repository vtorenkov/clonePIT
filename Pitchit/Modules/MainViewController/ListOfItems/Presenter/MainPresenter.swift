//
//  MainPresenter.swift
//  Pitchit
//
//  Created by Alex on 7/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation


class MainPresenter: NSObject, Presenter {
    
    typealias PresenterView = MainViewController
    
    weak var view: PresenterView!
    
//    let service:RestServiceManager
//
//    let amazonService = AmazonService()
    
//    required init(view: PresenterView ,service:RestServiceManager = RestServiceManager()) {

    required init(view: PresenterView) {
        self.view = view
    }
}
