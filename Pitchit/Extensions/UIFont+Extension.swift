//
//  UIFont+Extension.swift
//  Pitchit
//
//  Created by Alex on 9/16/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    private static func customFont(name: String, size: CGFloat) -> UIFont {
        let font = UIFont(name: name, size: size)
//        assert(font != nil, "Can't load font: \(name)")
        return font ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mainFonSFUItRegular(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SFUIDisplay-Regular", size: size)
    }
    
    static func mainFonSFUItMedium(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SFUIDisplay-Medium", size: size)
    }

    static func mainFonSFUItBold(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SFUIDisplay-Bold", size: size)
    }
    
    static func mainFonSFUItSemiBold(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SFUIDisplay-Semibold", size: size)
    }
    
    static func mainFonSFUItLight(ofSize size: CGFloat) -> UIFont {
        return customFont(name: "SFUIDisplay-Light", size: size)
    }

}
