//
//  NetworkError.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 Stores all error that comes from services with failure response.
 */
public class NetworkError: Error {
    
    public var returnCode: String?
    public var returnMessage: String?
    public var returnType: String?
    
    convenience init(_ returnCode: String?, returnMessage: String?, returnType: String?) {
        self.init()
        self.returnCode = returnCode
        self.returnMessage = returnMessage
        self.returnType = returnType
    }
}
