//
//  KeyChainConfiguration.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 This enum is used to select user or password for account value in Keychain.
 */
internal enum KeyChainValue: String {
    case user
    case password
}

/**
 This protocol is used set identifiers for storing values in Keychain.
 
 - service: In our case is the App identifier.
 - account: user / password
 - accessGroup: Used to share keys between apps. If not is used it will be nil.
 */
private protocol KeychainValueConfigurationProtocol {
    static var service: String { get }
    static var account: KeyChainValue { get }
    static var accessGroup: String? { get }
}

/**
 Class used for storing the user value in Keychain.
 */
public class KeychainUserConfiguration: KeychainValue, KeychainValueConfigurationProtocol {
    internal static var service: String { return GeneralInfo.keychainAccount }
    internal static var account: KeyChainValue { return .user }
    internal static var accessGroup: String? { return nil }
    
    required public override init() {
        super.init(serviceValue: KeychainUserConfiguration.service, accountValue: KeychainUserConfiguration.account.rawValue, accessGroupValue: KeychainUserConfiguration.accessGroup)
    }
}

/**
 Class used for storing the password value in Keychain.
 */
public class KeychainPasswordConfiguration: KeychainValue, KeychainValueConfigurationProtocol {
    internal static var service: String { return GeneralInfo.keychainAccount }
    internal static var account: KeyChainValue { return .password }
    internal static var accessGroup: String? { return nil }
    
    required public override init() {
        super.init(serviceValue: KeychainPasswordConfiguration.service, accountValue: KeychainPasswordConfiguration.account.rawValue, accessGroupValue: KeychainPasswordConfiguration.accessGroup)
    }
}


/**
 Handles the read/write/delete commands into Keychain.
 */
public class KeychainValue {
    
    // MARK: Types
    enum KeychainError: Error {
        case noValue
        case unexpectedValueData
        case unexpectedItemData
        case unhandledError(status: OSStatus)
    }
    
    // MARK: Properties
    var serviceValue: String
    var accountValue: String
    var accessGroupValue: String?
    
    
    // MARK: Intialization
    init () {
        self.serviceValue = ""
        self.accountValue = ""
        self.accessGroupValue = nil
    }
    
    init (serviceValue: String, accountValue: String, accessGroupValue: String?) {
        self.serviceValue = serviceValue
        self.accountValue = accountValue
        self.accessGroupValue = accessGroupValue
    }
    
    
    // MARK: Keychain access
    /**
     Reads the value from the Keychain.
     */
    func read() throws -> String  {
        /*
         Build a query to find the item that matches the service, account and
         access group.
         */
        var query = KeychainValue.keychainQuery(withService: serviceValue, account: accountValue, accessGroup: accessGroupValue)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        query[kSecReturnData as String] = kCFBooleanTrue
        
        // Try to fetch the existing keychain item that matches the query.
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        
        // Check the return status and throw an error if appropriate.
        guard status != errSecItemNotFound else { throw KeychainError.noValue }
        guard status == noErr else { throw KeychainError.unhandledError(status: status) }
        
        // Parse the value string from the query result.
        guard let existingItem = queryResult as? [String : AnyObject],
            let valueData = existingItem[kSecValueData as String] as? Data,
            let value = String(data: valueData, encoding: String.Encoding.utf8)
            else {
                throw KeychainError.unexpectedValueData
        }
        
        return value
    }
    
    /**
     Writes the value into Keychain.
     - parameter value: The value to save.
     */
    func save(_ value: String) throws {
        // Encode the value into an Data object.
        let encodedValue = value.data(using: String.Encoding.utf8)!
        
        do {
            // Check for an existing item in the keychain.
            try _ = read()
            
            // Update the existing item with the new value.
            var attributesToUpdate = [String : AnyObject]()
            attributesToUpdate[kSecValueData as String] = encodedValue as AnyObject?
            
            let query = KeychainValue.keychainQuery(withService: serviceValue, account: accountValue, accessGroup: accessGroupValue)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            // Throw an error if an unexpected status was returned.
            guard status == noErr else { throw KeychainError.unhandledError(status: status) }
        }
        catch KeychainError.noValue {
            /*
             No value was found in the keychain. Create a dictionary to save
             as a new keychain item.
             */
            var newItem = KeychainValue.keychainQuery(withService: serviceValue, account: accountValue, accessGroup: accessGroupValue)
            newItem[kSecValueData as String] = encodedValue as AnyObject?
            
            // Add a the new item to the keychain.
            let status = SecItemAdd(newItem as CFDictionary, nil)
            
            // Throw an error if an unexpected status was returned.
            guard status == noErr else { throw KeychainError.unhandledError(status: status) }
        }
    }
    
    /**
     Removes the value from the Keychain.
     */
    func delete() throws {
        // Delete the existing item from the keychain.
        let query = KeychainValue.keychainQuery(withService: serviceValue, account: accountValue, accessGroup: accessGroupValue)
        let status = SecItemDelete(query as CFDictionary)
        
        // Throw an error if an unexpected status was returned.
        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.unhandledError(status: status) }
    }
    
    
    //    func renameAccount(_ newAccountName: String) throws {
    //        // Try to update an existing item with the new account name.
    //        var attributesToUpdate = [String : AnyObject]()
    //        attributesToUpdate[kSecAttrAccount as String] = newAccountName as AnyObject?
    //
    //        let query = KeychainValue.keychainQuery(withService: service, account: self.account, accessGroup: accessGroup)
    //        let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
    //
    //        // Throw an error if an unexpected status was returned.
    //        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.unhandledError(status: status) }
    //
    //        self.account = newAccountName
    //    }
    
    //    static func valueItems(forService service: String, accessGroup: String? = nil) throws -> [KeychainValue] {
    //
    //        // Build a query for all items that match the service and access group.
    //        var query = KeychainValue.keychainQuery(withService: service, accessGroup: accessGroup)
    //        query[kSecMatchLimit as String] = kSecMatchLimitAll
    //        query[kSecReturnAttributes as String] = kCFBooleanTrue
    //        query[kSecReturnData as String] = kCFBooleanFalse
    //
    //        // Fetch matching items from the keychain.
    //        var queryResult: AnyObject?
    //        let status = withUnsafeMutablePointer(to: &queryResult) {
    //            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
    //        }
    //
    //        // If no items were found, return an empty array.
    //        guard status != errSecItemNotFound else { return [] }
    //
    //        // Throw an error if an unexpected status was returned.
    //        guard status == noErr else { throw KeychainError.unhandledError(status: status) }
    //
    //        // Cast the query result to an array of dictionaries.
    //        guard let resultData = queryResult as? [[String : AnyObject]] else { throw KeychainError.unexpectedItemData }
    //
    //        // Create a `KeychainValueItem` for each dictionary in the query result.
    //        var valueItems = [KeychainValue]()
    //        for result in resultData {
    //            guard let account  = result[kSecAttrAccount as String] as? String else { throw KeychainError.unexpectedItemData }
    //
    //            let valueItem = KeychainValue(service: service, account: account, accessGroup: accessGroup)
    //            valueItems.append(valueItem)
    //        }
    //
    //        return valueItems
    //    }
    
    // MARK: Convenience
    
    private static func keychainQuery(withService service: String, account: String? = nil, accessGroup: String? = nil) -> [String : AnyObject] {
        
        var query = [String : AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        
        query[kSecAttrService as String] = service as AnyObject?
        
        if let account = account {
            query[kSecAttrAccount as String] = account as AnyObject?
        }
        
        if let accessGroup = accessGroup {
            query[kSecAttrAccessGroup as String] = accessGroup as AnyObject?
        }
        
        return query
    }
}


