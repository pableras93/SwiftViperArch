//
//  Biometrics.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import LocalAuthentication

enum BiometricType: Int {
    case none = 0
    case touchID
    case faceID
}

enum BiometricError: Int {
    case biometricsNotAvailable = 0
    case authenticationFailed
    case jailbreakActivated
    case unknow
}

class Biometrics {
    
    var context = LAContext()
    
    // MARK: - Public methods
    var biometricType: BiometricType {
        if #available(iOS 11.0, *) {
            
            initContext()
            switch context.biometryType {
            case .faceID: return BiometricType.faceID
            case .touchID: return BiometricType.touchID
            case .none: return BiometricType.none
            }
            
        } else {
            // Fallback on earlier versions
            let (isAvailable, _) = canEvaluatePolicy()
            if isAvailable {
                return BiometricType.touchID
            } else {
                return BiometricType.none
            }
        }
    }
    
    func checkAccess(completion: @escaping (Bool, BiometricError?) -> Void) {
        
        if SecurityUtils.devicesIsJailBroken() {
            completion(false, BiometricError.jailbreakActivated)
            return
        }
        
        initContext()
        let (isAvailable, error) = canEvaluatePolicy()
        if isAvailable {
            
            UserDefaultsManager.biometricsIsCheckingAccess = true
            
            let reason = (biometricType == .faceID ? "biometrics_login_account_faceid_text" : "biometrics_login_account_touchid_text").localized
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason ) { success, error in
                
                UserDefaultsManager.biometricsIsCheckingAccess = false
                
                if success {
                    completion(true, nil)
                } else {
                    if let laError = error as? LAError {
                        if laError.code == LAError.userCancel || laError.code == LAError.userFallback || laError.code == LAError.systemCancel {
                            // Nothing here
                        }else if laError.code == LAError.authenticationFailed { // LAError.appCancel
                            completion(false, BiometricError.authenticationFailed)
                        }else {
                            
                            if #available(iOS 11.0, *) {
                                if laError.code == LAError.biometryLockout {
                                    completion(false, BiometricError.authenticationFailed)
                                }else {
                                    completion(false, BiometricError.unknow)
                                }
                                
                            } else {
                                completion(false, BiometricError.unknow)
                            }
                        }
                    }
                    else {
                        //print(error?.localizedDescription ?? "Failed to authenticate")
                        completion(false, BiometricError.unknow)
                    }
                }
            }
            
        }else {
            print(error?.localizedDescription ?? "Can't evaluate policy")
            completion(false, BiometricError.biometricsNotAvailable)
        }
    }
    
    
    // MARK: - Activation methods
    
    func biometricsIsActivated() -> Bool {
        return UserDefaultsManager.biometricsIsActivated
    }
    
    func activateBiometrics() {
        UserDefaultsManager.biometricsIsActivated = true
    }
    
    func deactivateBiometrics() {
        UserDefaultsManager.biometricsIsActivated = false
    }
    
    // MARK: - Registration methods
    func biometricsIsRegistered() -> Bool {
        return UserDefaultsManager.biometricsIsRegistrered
    }
    
    func registerBiometrics() {
        UserDefaultsManager.biometricsIsRegistrered = true
    }
    
    func unregisterBiometrics() {
        UserDefaultsManager.biometricsIsRegistrered = false
    }
    
    func isAvailable() -> Bool {
        return canEvaluatePolicy().0
    }
    
    
    // MARK: - Helper methods
    private func initContext() {
        context = LAContext()
        // The biometryType, which affects this app's UI when state changes, is only meaningful
        //  after running canEvaluatePolicy. But make sure not to run this test from inside a
        //  policy evaluation callback (for example, don't put next line in the state's didSet
        //  method, which is triggered as a result of the state change made in the callback),
        //  because that might result in deadlock.
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
    }
    
    private func canEvaluatePolicy() -> (Bool, Error?)  {
        var error: NSError?
        let evaluation = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        return (evaluation, error)
    }
    
}
