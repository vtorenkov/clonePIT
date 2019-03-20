//
//  UserManager.swift
//  Pitchit
//
//  Created by Alex on 9/17/18.
//  Copyright © 2018 Alexei Jovmir. All rights reserved.
//

import Foundation
import KeychainSwift

let kUserPass = "user_pass"
let kUserObject = "currentUser"

class UserManager {
    
    class func savePassword(user: RegisterModel) {
        if let pass = user.passWord {
            KeychainSwift().set(pass, forKey: kUserPass)
            storeCurrentUserObject(user: user)
        }
    }
    
    class func getPassword() -> String {
        let keychain = KeychainSwift()
        if let pass = keychain.get(kUserPass) {
            return pass
        }
        return ""
    }
    
    class func deletePass() {
        let keychain = KeychainSwift()
        keychain.delete(kUserPass)
        removeCurrentUserObject()
    }
    
    class func isUserIsLoggin() -> Bool {
        if let pass = KeychainSwift().get(kUserPass) {
            if !pass.isEmpty {
                return true
            }
        }
        return false
    }
    
    class func storeCurrentUserObject(user: RegisterModel) {
        let keychain = KeychainSwift()
        if let encoded = try? JSONEncoder().encode(user) {
            keychain.set(encoded, forKey: kUserObject)
        }
    }
    
    class func getCurrentUserObject() -> RegisterModel {
        let keychain = KeychainSwift()
        
        if let user = keychain.getData(kUserObject), let loadedUser = try? JSONDecoder().decode(RegisterModel.self, from: user), let userExist = loadedUser as? RegisterModel {
            return userExist
        }
        return RegisterModel()
    }
    
    class func removeCurrentUserObject() {
        let keychain = KeychainSwift()
        keychain.delete(kUserObject)
    }
    
}
