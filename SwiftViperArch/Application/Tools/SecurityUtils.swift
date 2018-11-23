//
//  SecurityUtils.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

public class SecurityUtils {
    
    static func devicesIsJailBroken() -> Bool {
        
        #if !SIMULATOR
        // Check 1 : existence of files that are common for jailbroken devices
        if FileManager.default.fileExists(atPath: "/Applications/Cydia.app") ||
            FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib") ||
            FileManager.default.fileExists(atPath: "/bin/bash") ||
            FileManager.default.fileExists(atPath: "/usr/sbin/sshd") ||
            FileManager.default.fileExists(atPath: "/etc/apt") ||
            FileManager.default.fileExists(atPath: "/private/var/lib/apt/") ||
            UIApplication.shared.canOpenURL(URL(string:"cydia://package/com.example.package")!) {
            
            return true
        }
        
        // Check 2 : Reading and writing in system directories (sandbox violation)
        let stringToWrite = "Jailbreak Test"
        do
        {
            try stringToWrite.write(toFile:"/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
            //Device is jailbroken
            return true
        }catch
        {
            return false
        }
        #else
        return false
        #endif
        
    }
    
}

