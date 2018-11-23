//
//  NetworkCommonConfigInfo.swift
//  SwiftViperArch
//
//  Created by Pablo Barcos on 23/11/18.
//  Copyright © 2018 Pablo Barcos. All rights reserved.
//

import Foundation
import UIKit

/**
 Class used to set all default values for mandatory network fields to send in all services.
 */
class NetworkCommonConfigInfo: NetworkConfigProtocol {
    
    // MARK: - Common values for all applications
    final var appId: String { return "" }
    final var companyId: String { return "" }
    final var uniqueId: String { return UIDevice.current.identifierForVendor!.uuidString }
    
    // MARK: - Changing values for applications
    var baseURL: String { return "" }
    var branding: String { return "" }
    var channelId: String { return "" }
    var prescriberId: String { return "" }
}

