//
//  UITextView+Extension.swift
//  Pitchit
//
//  Created by Alex on 1/20/19.
//  Copyright © 2019 Alexei Jovmir. All rights reserved.
//

import Foundation
import UIKit


class PaddingTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 5)
        
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
