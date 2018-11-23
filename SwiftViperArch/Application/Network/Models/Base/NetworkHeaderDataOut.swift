//
//  NetworkHeaderDataOut.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 This class recieves the common fields that are returned in every service network call.
 */
class NetworkHeaderDataOut: Decodable {
    var returnCode: String?
    var returnOperative: String?
    var returnType: String?
    var returnMessage: String?
    
    /**
     Initializes the class with the returned values given.
     
     - parameter returnCode: Code value returned.
     - parameter returnOperative: Operative value returned.
     - parameter returnType: Type value returned.
     - parameter returnMessage: Message value returned.
     */
    init(returnCode: String?, returnOperative: String?, returnType: String?, returnMessage: String?) {
        self.returnCode = returnCode
        self.returnOperative = returnOperative
        self.returnType = returnType
        self.returnMessage = returnMessage
    }
    
    /**
     Enum with all literals fields returned into every service network call.
     */
    enum CodingKeys: String, CodingKey {
        case returnCode = "codigoRetorno"
        case returnOperative = "codigoOperativa"
        case returnType = "tipoRetorno"
        case returnMessage = "mensajeRetorno"
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.returnCode = try container.decodeIfPresent(String.self, forKey: .returnCode)
        self.returnOperative = try container.decodeIfPresent(String.self, forKey: .returnOperative)
        self.returnType = try container.decodeIfPresent(String.self, forKey: .returnType)
        self.returnMessage = try container.decodeIfPresent(String.self, forKey: .returnMessage)
    }
}
