//
//  UIColor+Extension.swift
//  Pitchit
//
//  Created by Alex on 9/14/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @nonobjc class var cornflower90: UIColor {
        return UIColor(red: 106.0 / 255.0, green: 106.0 / 255.0, blue: 242.0 / 255.0, alpha: 0.9)
    }
    @nonobjc class var ice: UIColor {
        return UIColor(red: 223.0 / 255.0, green: 1.0, blue: 248.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var robinsEggBlue: UIColor {
        return UIColor(red: 149.0 / 255.0, green: 247.0 / 255.0, blue: 226.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var carolinaBlue: UIColor {
        return UIColor(red: 140.0 / 255.0, green: 186.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var cornflower: UIColor {
        return UIColor(red: 120.0 / 255.0, green: 120.0 / 255.0, blue: 243.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var menuGray: UIColor {
        return UIColor(rgb: 0x3e4040)
    }
    
    @nonobjc class var navBarColor: UIColor {
        return UIColor(rgb: 0xfcfcfc)
    }
    
    @nonobjc class var searchBackColor: UIColor {
        return UIColor(rgb: 0xF8F7F7)
    }
    
    @nonobjc class var switchBlue: UIColor {
        return UIColor(rgb: 0x8C92F5)
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
