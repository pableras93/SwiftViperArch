//
//  StringExtension.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        let local = localized(in: .target)
        if local == self {
            return localized(in: .general)
        }else {
            return local
        }
    }
    
    
    func addPercentage() -> String {
        if self == "" {
            return ""
        }else {
            return self + " %"
        }
    }
    
    func validatePhone() -> Bool {
        let PHONE_REGEX = "^(\\+\\d{1,3})?\\d{9,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
}

// MARK: - Private methods
extension String {
    
    private enum LocalizableTableName: String {
        case general = "Localizable"
        case target = "Target"
    }
    
    private func localized(in tableName: LocalizableTableName) -> String {
        return NSLocalizedString(self, tableName: tableName.rawValue, comment: "")
    }
    
    
}

extension Optional where Wrapped == String {
    
    func emptyIfNil() -> String {
        return (self == nil ? "" : self?.trimmingCharacters(in: .whitespaces))!
    }
    
}
