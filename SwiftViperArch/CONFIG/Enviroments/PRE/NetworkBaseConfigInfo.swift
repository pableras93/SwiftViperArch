//
//  NetworkBaseConfigInfo.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation

/**
 Class used to set specifics values for PRE enviroment network fields to send in all services.
 */
class NetworkBaseConfigInfo: NetworkCommonConfigInfo {
    override final var baseURL: String { return "" }
}
