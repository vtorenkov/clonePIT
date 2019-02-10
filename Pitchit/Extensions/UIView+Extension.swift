//
//  UIView+Extension.swift
//  Pitchit
//
//  Created by Alex on 8/27/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        layer.colors = [UIColor.cornflower90.cgColor, UIColor.ice.cgColor]
        self.layer.addSublayer(layer)
    }
    
    
    func addGradientMenu() {
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        layer.colors = [UIColor.black.cgColor, UIColor.menuGray.cgColor]
        self.layer.addSublayer(layer)
    }
    
    func roundCorners() {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    func roundCornersSmall() {
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
    }
    
    func roundCornersButton() {
        self.layer.cornerRadius = 2
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
    func circleCorners() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    
    func roundCornersWhiteBorders() {
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
    }
}
