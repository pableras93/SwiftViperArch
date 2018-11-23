//
//  KeychainManager.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 Class used for handling the storing of user/password values in Keychain.
 */
public class KeyChainManager {
    
    /**
     User value stored in the Keychain.
     */
    static var user: String {
        get {
            do {
                return try KeychainUserConfiguration().read()
            } catch  {
                print("Keychain - Error trying to read the user \(error.localizedDescription)")
                return ""
            }
        }
        set {
            do {
                try KeychainUserConfiguration().save(newValue)
            } catch {
                print("Keychain - Error trying to save the user \(error.localizedDescription)")
            }
        }
    }
    
    /**
     Password value stored in the Keychain.
     */
    static var password: String {
        get {
            do {
                return try KeychainPasswordConfiguration().read()
            } catch  {
                print("Keychain - Error trying to read the password \(error.localizedDescription)")
                return ""
            }
        }
        set {
            do {
                try KeychainPasswordConfiguration().save(newValue)
            } catch {
                print("Keychain - Error trying to save the password \(error.localizedDescription)")
            }
        }
    }
    
    /**
     User/password values stored in the Keychain.
     */
    static var credentials: (String, String) {
        get {
            return (self.user, self.password)
        }
    }
    
}
