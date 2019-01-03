//
//  Presenter.swift
//  Pitchit
//
//  Created by Alex on 7/7/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation

protocol Presenter {
    associatedtype PresenterView
    var view: PresenterView! { get set }
}
