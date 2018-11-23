//
//  NetworkServices.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import Alamofire

/**
 This class will return the default values for all services values that are necesary for every network connection.
 */
class NetworkBaseService: NetworkServiceProtocol {
    
    var path: String { return "" }
    
    var url: String { return "\(NetworkConfigInfo().baseURL)\(path)"}
    
    var type: HTTPMethod { return HTTPMethod.post }
    
    var encoding: ParameterEncoding { return JSONEncoding.default }
}

/**
 Used to subclass all different services used in the application.
 */
enum NetworkService {
    
    /**
     Overrides NetworkBaseService to set the propper values for authentication service.
     */
    class AuthenticacionService: NetworkBaseService {
        override var path: String { return "autentificacionUsuario" }
    }
    
    /**
     Overrides NetworkBaseService to set the propper values for remenber tpin service.
     */
    class RememberTPINService: NetworkBaseService {
        override var path: String { return "recordarTpin" }
    }
    
}

