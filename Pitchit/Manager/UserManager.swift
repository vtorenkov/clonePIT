//
//  UserManager.swift
//  Pitchit
//
//  Created by Alex on 9/17/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import KeychainSwift

class UserManager {
    
    class func savePassword(pass:String) {
        KeychainSwift().set(pass, forKey: "user_pass")
    }
    
    class func getPassword() -> String {
        let keychain = KeychainSwift()
        
        if let pass = keychain.get("user_pass") {
            return pass
        }
        return ""
    }
    
    class func deletePass() {
        let keychain = KeychainSwift()
        keychain.delete("user_pass")
    }
    
    class func isUserIsLoggin() -> Bool {
        if let pass = KeychainSwift().get("user_pass") {
            if !pass.isEmpty {
                return true
            }
        }
        return false
    }
}
