//
//  UserDefaultsManager.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

class UserDefaultsManager: UserDefaults {
    
    private static var shared: UserDefaults { return UserDefaults(suiteName: GeneralInfo.userDefaultsSuiteName)! }
    
    private enum Keys: String {
        //case language
        case biometricsIsActivated
        case biometricsIsRegistrered
        case biometricsIsCheckingAccess
    }
    
    static func registerDefaults() {
        //shared.register( defaults: [ Keys.language.rawValue: getDefaultAppLanguage(from: Locale.current.languageCode).code ])
        shared.register( defaults: [ Keys.biometricsIsActivated.rawValue : true ])
        shared.register( defaults: [ Keys.biometricsIsRegistrered.rawValue : false ])
        shared.register( defaults: [ Keys.biometricsIsCheckingAccess.rawValue : false ])
    }
    
    //    // MARK: - Keys for language
    //    static var language: AppLanguageProtocol {
    //        get {
    //            if let languageCode = shared.value(forKey: Keys.language.rawValue) as? String {
    //                return getDefaultAppLanguage(from: languageCode)
    //            }
    //            return getDefaultAppLanguage()
    //        }
    //        set {
    //            shared.set(newValue.code , forKey: Keys.language.rawValue)
    //        }
    //    }
    
    // MARK: - Keys for Biometrics
    static var biometricsIsActivated: Bool {
        get {
            return shared.value(forKey: Keys.biometricsIsActivated.rawValue) as? Bool ?? false
        }
        set {
            shared.set(newValue, forKey: Keys.biometricsIsActivated.rawValue)
        }
    }
    
    static var biometricsIsRegistrered: Bool {
        get {
            return shared.value(forKey: Keys.biometricsIsRegistrered.rawValue) as? Bool ?? false
        }
        set {
            shared.set(newValue, forKey: Keys.biometricsIsRegistrered.rawValue)
        }
    }
    
    static var biometricsIsCheckingAccess: Bool {
        get {
            return shared.value(forKey: Keys.biometricsIsCheckingAccess.rawValue) as? Bool ?? false
        }
        set {
            shared.set(newValue, forKey: Keys.biometricsIsCheckingAccess.rawValue)
        }
    }
    
    
    //    // MARK: - Helper methods
    //    private static func getDefaultAppLanguage(from languageCode: String? = nil) -> AppLanguageProtocol {
    //
    //        switch languageCode {
    //        case AppLanguage.Spanish().code:
    //            return AppLanguage.Spanish()
    //        case AppLanguage.Catalan().code:
    //            return AppLanguage.Catalan()
    //        case AppLanguage.Basque().code:
    //            return AppLanguage.Basque()
    //        case AppLanguage.Galician().code:
    //            return AppLanguage.Galician()
    //        default:
    //            // If app default language is not one of the app's languages, we'll set the default language
    //            return AppLanguage.Spanish()
    //        }
    //    }
}

