//
//  UIImage+Extension.swift
//  Pitchit
//
//  Created by Alex on 7/12/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
    func setRoundedCorners() {
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
